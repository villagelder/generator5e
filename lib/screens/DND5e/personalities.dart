import 'package:flutter/material.dart';
import 'package:generator5e/services/personalityGenerator.dart';

class PersonalitiesPage extends MaterialPageRoute<void> {
  PersonalitiesPage()
      : super(builder: (BuildContext ctx) {

    String? dropDownValue;

          return Scaffold(
            backgroundColor: Colors.blueGrey.shade100,
            appBar: AppBar(
              title: const Text(
                'Legendary Generators',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  color: Color.fromRGBO(255, 245, 188, 1.0),
                ),
              ),
              backgroundColor: const Color.fromRGBO(57, 0, 0, 1.0),
            ),
            body: const ListViewer(),
          );
        });
}

class AlignmentDDB extends StatefulWidget {
  const AlignmentDDB({super.key});

  @override
  State<AlignmentDDB> createState() => _AlignmentDDBState();
}

class GenTypeDDB extends StatefulWidget {
  const GenTypeDDB({super.key});

  @override
  State<GenTypeDDB> createState() => _GenTypeDDBState();
}

class ItemSubTypeDDB extends StatefulWidget {
  const ItemSubTypeDDB({super.key});

  @override
  State<ItemSubTypeDDB> createState() => _ItemSubTypeDDBState();
}

const List<String> alignmentList = <String>[
  'Any Alignment',
  'Good',
  'Neutral',
  'Evil'
];
const List<String> numberList = <String>['1', '2', '3', '5', '8', '13'];

class BackgroundDDB extends StatefulWidget {
  const BackgroundDDB({super.key});

  @override
  State<BackgroundDDB> createState() => _BackgroundDDBState();

  String? getDropDownValue(){
    return _BackgroundDDBState?.dropDownValue;
  }
}

class _BackgroundDDBState extends State<BackgroundDDB> {
  PersonalityGenerator personalityGenerator = PersonalityGenerator();
  static String? dropDownValue;


  late Future<List<String>> backgroundsFuture;

  @override
  void initState() {
    super.initState();
    backgroundsFuture = getAllBackgrounds();
  }

  Future<List<String>> getAllBackgrounds() async {
    return personalityGenerator.getBackgroundList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: const Color.fromRGBO(38, 50, 56, 1.0),
            style: BorderStyle.solid,
            width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.34,
      // height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: FutureBuilder<List<String>>(
              future: getAllBackgrounds(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  var data = snapshot.data!;
                  if (data.isEmpty) {
                    return const Text("No data available");
                  }
                  return DropdownButton<String>(
                    value: dropDownValue ?? data[0],
                    // ... other properties
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
                    items: data.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                } else {
                  return const Text("No data");
                }
              }),
        ),
      ),
    );
  }
}

class _AlignmentDDBState extends State<AlignmentDDB> {
  static String numberValue = numberList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.1,
      // height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: numberValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
                color: const Color.fromRGBO(38, 50, 56, 1.0),
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.035,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                numberValue = value!;
              });
            },
            items: numberList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _GenTypeDDBState extends State<GenTypeDDB> {
  static String itemValue = alignmentList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.34,
      // height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: itemValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
                color: const Color.fromRGBO(38, 50, 56, 1.0),
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.035,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                itemValue = value!;
              });
            },
            items: alignmentList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemSubTypeDDBState extends State<ItemSubTypeDDB> {
  static String itemValue = alignmentList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      // width: MediaQuery.of(context).size.width * 0.4,
      // height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: itemValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
                color: const Color.fromRGBO(38, 50, 56, 1.0),
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.023,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                itemValue = value!;
              });
            },
            items: alignmentList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  // Declare the variable
  List<String>? traitsList = ['Personality'];
  PersonalityGenerator personalityGenerator = PersonalityGenerator();

  String? dropDownValue;


  updateList() {
    personalityGenerator.init();
    traitsList = personalityGenerator.generate(BackgroundDDB().getDropDownValue(), _AlignmentDDBState.numberValue);
    setState(() {
      traitsList;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(ctx).size.width * 0.4,
              height: MediaQuery.of(ctx).size.width * 0.44,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(ctx).size.height * 0.04, 20, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(ctx).size.height * 0.06,
                          child: Text(
                            '5e Personality Generator',
                            style: TextStyle(
                              fontFamily: 'Georgia',
                              fontSize: MediaQuery.of(ctx).size.height * 0.044,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(34, 56, 69, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackgroundDDB(),
                          // AlignmentDDB(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GenTypeDDB(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.of(ctx).size.width * 0.34,
                        height: MediaQuery.of(ctx).size.height * 0.135,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                const Color.fromRGBO(255, 245, 188, 1.0),
                            backgroundColor: Colors.lightGreen.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () => updateList(),
                          child: Text(
                            'Generate Personality',
                            style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: MediaQuery.of(ctx).size.height * .035,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(ctx).size.width * 0.58,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(ctx).size.height * 0.035, 0, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(ctx).size.height * 0.75,
                          child: Card(
                            elevation: 0,
                            color: Colors.blueGrey.shade100,
                            child: ListView.builder(
                              key: ObjectKey(traitsList?[0]),
                              itemCount: traitsList?.length,
                              itemBuilder: (ctx, index) {
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0,
                                      MediaQuery.of(ctx).size.height * 0.01,
                                      0,
                                      0),
                                  child: ListTile(
                                    title: Text(traitsList![index]),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: const BorderSide(
                                          width: 1.5,
                                          color: Color.fromRGBO(0, 102, 0, 1)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
