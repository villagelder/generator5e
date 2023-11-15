import 'package:flutter/material.dart';
import 'package:generator5e/services/magicItemGenerator.dart';

class PersonalitiesPage extends MaterialPageRoute<void> {
  PersonalitiesPage()
      : super(builder: (BuildContext ctx) {
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

class ItemTypeDDB extends StatefulWidget {
  const ItemTypeDDB({super.key});

  @override
  State<ItemTypeDDB> createState() => _ItemTypeDDBState();
}

class ItemSubTypeDDB extends StatefulWidget {
  const ItemSubTypeDDB({super.key});

  @override
  State<ItemSubTypeDDB> createState() => _ItemSubTypeDDBState();
}

class BackgroundDDB extends StatefulWidget {
  const BackgroundDDB({super.key});

  @override
  State<BackgroundDDB> createState() => _BackgroundDDBState();
}

const List<String> backgroundList = <String>[
  'Any Rarity',
  'Common',
  'Uncommon',
  'Rare',
  'Very Rare',
  'Legendary',
  'Artifact'
];
const List<String> itemTypeList = <String>[
  'All Items',
  'Armor',
  'Potion',
  'Ring',
  'Rod',
  'Scroll',
  'Staff',
  'Wand',
  'Weapon',
  'Wondrous Item'
];
const List<String> numberList = <String>['1', '2', '3', '5', '8', '13'];

class _BackgroundDDBState extends State<BackgroundDDB> {
  static String rarityValue = backgroundList.first;

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
      width: MediaQuery.of(context).size.width * 0.225,
      // height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: rarityValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
              color: const Color.fromRGBO(38, 50, 56, 1.0),
              fontFamily: 'Georgia',
              fontSize: MediaQuery.of(context).size.height * 0.035,
              fontWeight: FontWeight.w500,
            ),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                rarityValue = value!;
              });
            },
            items: backgroundList.map<DropdownMenuItem<String>>((String value) {
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

class _ItemTypeDDBState extends State<ItemTypeDDB> {
  static String itemValue = itemTypeList.first;

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

class _ItemSubTypeDDBState extends State<ItemSubTypeDDB> {
  static String itemValue = itemTypeList.first;

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

class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  // Declare the variable
  List<String> magicItemsList = ['Magic Items'];
  MagicItemGenerator5e mig5e = MagicItemGenerator5e();

  updateList() {
    magicItemsList = mig5e.generateMagicItemsArray(_BackgroundDDBState.rarityValue,
        _ItemTypeDDBState.itemValue, _AlignmentDDBState.numberValue);
    setState(() {
      magicItemsList;
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
                padding:  EdgeInsets.fromLTRB(20, MediaQuery.of(ctx).size.height * 0.04, 20, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(ctx).size.height * 0.06,
                          child: Text(
                            '5e Magic Item Generator',
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
                      padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackgroundDDB(),
                          AlignmentDDB(),
                        ],
                      ),
                    ),
                     Padding(
                      padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ItemTypeDDB(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
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
                            'Generate Magic Items',
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
                              key: ObjectKey(magicItemsList[0]),
                              itemCount: magicItemsList.length,
                              itemBuilder: (ctx, index) {
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0,
                                      MediaQuery.of(ctx).size.height * 0.01,
                                      0,
                                      0),
                                  child: ListTile(
                                    title: Text(magicItemsList[index]),
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
