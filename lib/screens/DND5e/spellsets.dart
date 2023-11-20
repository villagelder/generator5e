import 'dart:html';

import 'package:flutter/material.dart';
import 'package:generator5e/services/spellSetGenerator5e.dart';

class SpellSetsPage extends MaterialPageRoute<void> {
  SpellSetsPage()
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

class SubclassDDB extends StatefulWidget {
  final List<String> subclassOptions;
  const SubclassDDB({super.key, required this.subclassOptions});

  @override
  State<SubclassDDB> createState() => _SubclassDDBState();
}

class ClassesDDB extends StatefulWidget {
  final Function(String) onClassChanged;

  const ClassesDDB({super.key, required this.onClassChanged});

  @override
  State<ClassesDDB> createState() => _ClassesDDBState();
}

class NumberDDB extends StatefulWidget {
  const NumberDDB({super.key});

  @override
  State<NumberDDB> createState() => _NumberDDBState();
}

const List<String> arcaneList = <String>[
  'Abjuration',
  'Bladesinging',
  'Conjuration',
  'Divination',
  'Enchantment',
  'Evocation',
  'Illusion',
  'Necromancy',
  'Order of Scribes',
  'Transmutation',
  'War Magic'
];

const List<String> classList = <String>[
  'Any Caster',
  'Artificer',
  'Bard',
  'Cleric',
  'Druid',
  'Eld Knight',
  'Paladin',
  'Ranger',
  'Rogue',
  'Sorcerer',
  'Warlock',
  'Wizard'
];

const List<String> subclassList = <String>['Any Subclass'];

const List<String> numberList = <String>[
  'Any Level',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  'Legendary'
];

class _NumberDDBState extends State<NumberDDB> {
  static String numberValue = numberList.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.shade400,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: Colors.brown.shade900,
              style: BorderStyle.solid,
              width: 2.0),
        ),
        width: MediaQuery
            .of(context)
            .size
            .width * 0.15,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.125,
        // height: MediaQuery.of(context).size.height * 0.075,
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
              elevation: 16,
              style: TextStyle(
                  color: Colors.amber.shade100,
                  fontFamily: 'Georgia',
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.033,
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
      ),
    );
  }
}

class _ClassesDDBState extends State<ClassesDDB> {
  static String classValue = classList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown.shade400,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: const Color.fromRGBO(38, 50, 56, 1.0),
            style: BorderStyle.solid,
            width: 2.0),
      ),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.175,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.125,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
                dropdownColor: Colors.brown.shade400,
                value: classValue,
                icon: Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.brown.shade900,
                ),
                elevation: 16,
                style: TextStyle(
                  color: Colors.amber.shade100,
                  fontFamily: 'Georgia',
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.04,
                  fontWeight: FontWeight.w500,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.brown.shade900,
                ),
                onChanged: (String? value) {
                  setState(() {
                    classValue = value!;
                  });
                },
                //set new list for subclass button

                widget.onClassChanged(value!);

                items: classList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
        );
        }).toList(),
      ),
    ),)
    ,
    );
  }
}

class _SubclassDDBState extends State<SubclassDDB> {
  String subclassValue;

  @override
  void initState(){
    super.initState();
    subclassValue = widget.subclassOptions.first;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown.shade400,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade900, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.34,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.125,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            dropdownColor: Colors.brown.shade400,
            value: subclassValue,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.brown.shade900,
            ),
            elevation: 16,
            style: TextStyle(
                color: Colors.amber.shade100,
                fontFamily: 'Georgia',
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .height * 0.04,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.brown.shade900,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                subclassValue = value!;
              });
            },
            items: widget.subclassOptions.map<DropdownMenuItem<String>>((String value) {
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
  Iterable<String> keys = ["Spell Set Generator"];
  Map<String, String> spellMap = {
    "Spell Set Generator": "Roll for a new spell set."
  };
  SpellSetGenerator spellGen = SpellSetGenerator();

  updateList() {
    spellGen.init();
    spellMap = spellGen.generateSpellSetMap(
        _ClassesDDBState.classValue, _NumberDDBState.numberValue);
    keys = spellMap.keys;

    setState(() {
      spellMap;
      if (keys.isEmpty) {
        keys = ["Spell Set Generator"];
      } else {
        keys;
      }
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
                width: MediaQuery
                    .of(ctx)
                    .size
                    .width * 0.4,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, MediaQuery
                      .of(ctx)
                      .size
                      .height * 0.06, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery
                                .of(ctx)
                                .size
                                .height * 0.06,
                            child: Text(
                              '5e Spell Set Generator',
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize:
                                MediaQuery
                                    .of(ctx)
                                    .size
                                    .height * 0.047,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(85, 0, 0, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(.03,
                            MediaQuery
                                .of(ctx)
                                .size
                                .height * 0.03, 0.03, 0),
                        //      child: SizedBox(
                        //       width: MediaQuery.of(ctx).size.width * 0.4,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClassesDDB(onClassChanged: (selectedClass) {
                              if (selectedClass == 'Wizard') {


                              },  },),
                            NumberDDB(),
                          ],
                        ),
                        //    ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(.03,
                            MediaQuery
                                .of(ctx)
                                .size
                                .height * 0.03, 0.03, 0),
                        //      child: SizedBox(
                        //       width: MediaQuery.of(ctx).size.width * 0.4,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SubclassDDB(),
                          ],
                        ),
                        //    ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery
                            .of(ctx)
                            .size
                            .height * 0.03, 0, 0),
                        child: SizedBox(
                          width: MediaQuery
                              .of(ctx)
                              .size
                              .width * 0.35,
                          height: MediaQuery
                              .of(ctx)
                              .size
                              .height * 0.125,
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
                              'Generate Spell Sets',
                              style: TextStyle(
                                  fontFamily: 'Georgia',
                                  fontSize:
                                  MediaQuery
                                      .of(ctx)
                                      .size
                                      .height * .05,
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
                width: MediaQuery
                    .of(ctx)
                    .size
                    .width * 0.58,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery
                          .of(ctx)
                          .size
                          .height * 0.035, 0, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery
                                .of(ctx)
                                .size
                                .height * 0.7,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 2,
                              color: Colors.brown.shade500,
                              child: ListView.builder(
                                key: ObjectKey(keys.first),
                                itemCount: keys.length,
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0,
                                        MediaQuery
                                            .of(ctx)
                                            .size
                                            .height * 0.01,
                                        0,
                                        0),
                                    child: ListTile(
                                      dense: true,
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(width: 2),
                                          borderRadius:
                                          BorderRadius.circular(15.0)),
                                      tileColor: Colors.orange.shade100,
                                      title: Text(
                                        keys.elementAt(index),
                                        style: TextStyle(
                                            fontSize:
                                            MediaQuery
                                                .of(ctx)
                                                .size
                                                .height *
                                                0.036),
                                      ),
                                      subtitle: Text(
                                          spellMap[keys.elementAt(index)]!),
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
