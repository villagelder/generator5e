import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator5e/services/trinketGenerator.dart';

class TrinketsPage extends MaterialPageRoute<void> {
  TrinketsPage()
      : super(builder: (BuildContext ctx) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
          // double screenWidth = MediaQuery.of(ctx).size.width;
          // double screenHeight = MediaQuery.of(ctx).size.height;

          return Scaffold(
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

class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  TrinketGenerator trinketGen = TrinketGenerator();
  List<String> trinketList = ['Roll for trinkets'];

  updateList() {
    trinketList = trinketGen.generateTrinketsArray(
        _ItemTypeDDBState.typeValue, _NumberDDBState.numberValue);
    setState(() {
      trinketList;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.amber.shade100,
            Colors.brown.shade600,
          ])),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(ctx).size.width * 0.4,
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
                              '5e Trinket Generator',
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: MediaQuery.of(ctx).size.height * 0.05,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(85, 0, 0, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(ctx).size.height * 0.04, 0, 0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ItemTypeDDB(),
                            NumberDDB(),
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
                              backgroundColor:
                                  const Color.fromRGBO(57, 0, 0, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () => updateList(),
                            child: Text(
                              'Generate Trinkets',
                              style: TextStyle(
                                  fontFamily: 'Georgia',
                                  fontSize:
                                      MediaQuery.of(ctx).size.height * .05,
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
                            height: MediaQuery.of(ctx).size.height * 0.7,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 2,
                              color: Colors.brown.shade500,
                              child: ListView.builder(
                                key: ObjectKey(trinketList[0]),
                                itemCount: trinketList.length,
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0,
                                        MediaQuery.of(ctx).size.height * 0.01,
                                        0,
                                        0),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      tileColor: Colors.orange.shade100,
                                      title: Text(
                                        trinketList[index],
                                        style: TextStyle(
                                            fontSize:
                                                MediaQuery.of(ctx).size.height *
                                                    0.04),
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
      ),
    );
  }
}

class NumberDDB extends StatefulWidget {
  const NumberDDB({super.key});

  @override
  State<NumberDDB> createState() => _NumberDDBState();
}

class ItemTypeDDB extends StatefulWidget {
  const ItemTypeDDB({super.key});

  @override
  State<ItemTypeDDB> createState() => _ItemTypeDDBState();
}

const List<String> itemTypeList = <String>[
  'Any Trinket',
  'Macabre',
  'Martial',
  'Mystical',
  'Nature',
  'Religious',
  'Romantic',
  'Scholarly',
  'Sentimental',
  'Traveler',
  "Whimsical"
];
const List<String> numberList = <String>['1', '2', '3', '5', '8', '13'];

class _NumberDDBState extends State<NumberDDB> {
  static String numberValue = numberList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown.shade400,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade900, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.115,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            dropdownColor: Colors.brown.shade400,
            value: numberValue,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.brown.shade900,
            ),
            style: TextStyle(
                color: Colors.amber.shade100,
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.brown.shade900,
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

class _ItemTypeDDBState extends State<ItemTypeDDB> {
  static String typeValue = itemTypeList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown.shade400,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade900, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.215,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            dropdownColor: Colors.brown.shade400,
            value: typeValue,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.brown.shade900,
            ),
            elevation: 16,
            style: TextStyle(
                color: Colors.amber.shade100,
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.brown.shade900,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                typeValue = value!;
              });
            },
            items: itemTypeList.map<DropdownMenuItem<String>>((String value) {
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
