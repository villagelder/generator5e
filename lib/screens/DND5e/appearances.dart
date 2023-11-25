import 'package:flutter/material.dart';
import 'package:generator5e/services/spellSetGenerator5e.dart';

class AppearancePage extends MaterialPageRoute<void> {
  AppearancePage()
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

class SubraceDDB extends StatefulWidget {
  final List<String> subraceOptions;
  final String selectedSubrace;
  final ValueChanged<String> onSubraceChanged;

  const SubraceDDB(
      {super.key,
      required this.subraceOptions,
      required this.selectedSubrace,
      required this.onSubraceChanged});

  @override
  State<SubraceDDB> createState() => _SubraceDDBState();
}

class RacesDDB extends StatefulWidget {
  final Function(String) onRaceChanged;

  const RacesDDB({super.key, required this.onRaceChanged});

  @override
  State<RacesDDB> createState() => _RacesDDBState();
}

class NumberDDB extends StatefulWidget {
  const NumberDDB({super.key});

  @override
  State<NumberDDB> createState() => _NumberDDBState();
}

const List<String> raceList = <String>[
  'Any Race',
  'Dragonborn',
  'Dwarf',
  'Elf',
  'Gnome',
  'Halfling',
  'Human',
  'Orc',
  'Tiefling'
];

const List<String> subclassList = <String>['Choose a Subclass'];

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
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.125,
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
                fontSize: MediaQuery.of(context).size.height * 0.033,
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

class _RacesDDBState extends State<RacesDDB> {
  static String raceValue = raceList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown.shade400,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade900, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.175,
      height: MediaQuery.of(context).size.height * 0.125,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            dropdownColor: Colors.brown.shade400,
            value: raceValue,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.brown.shade900,
            ),
            elevation: 16,
            style: TextStyle(
              color: Colors.amber.shade100,
              fontFamily: 'Georgia',
              fontSize: MediaQuery.of(context).size.height * 0.04,
              fontWeight: FontWeight.w500,
            ),
            underline: Container(
              height: 2,
              color: Colors.brown.shade900,
            ),
            onChanged: (String? newValue) {
              setState(() {
                raceValue = newValue!;
              });
              widget.onRaceChanged(
                  newValue!); // Notify the parent widget of the change
            },
            items: raceList.map<DropdownMenuItem<String>>((String value) {
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

class _SubraceDDBState extends State<SubraceDDB> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.shade400,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: Colors.brown.shade900,
              style: BorderStyle.solid,
              width: 2.0),
        ),
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.125,
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              dropdownColor: Colors.brown.shade400,
              value: widget.selectedSubrace,
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
              onChanged: (String? newValue) {
                // This is called when the user selects an item.
                widget.onSubraceChanged(newValue!);
                // setState(() {
                //   subclassValue = newValue!;
                // });
              },
              items: widget.subraceOptions
                  .map<DropdownMenuItem<String>>((String value) {
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

class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  List<String> currentSubraceOptions = subclassList;
  String selectedRace = raceList.first;
  String subraceValue = subclassList.first;

  void handleSubclassChange(String newSubclass) {
    setState(() {
      subraceValue = newSubclass;
    });
  }

  void updateSubraceOptions(String newRace) {
    setState(() {
      selectedRace = newRace;
      switch (newRace) {
        case "Any Race":
          currentSubraceOptions = anyList;
          break;
        case "Gnome":
          currentSubraceOptions = gnomeList;
          break;
        case "Dwarf":
          currentSubraceOptions = dwarfList;
          break;
        case "Elf":
          currentSubraceOptions = elfList;
          break;
        case "Halfling":
          currentSubraceOptions = halflingList;
          break;
        case "Orc":
          currentSubraceOptions = orcList;
          break;
        case "Tiefling":
          currentSubraceOptions = tieflingList;
          break;
        case "Dragonborn":
          currentSubraceOptions = dragonbornList;
          break;
        default:
          currentSubraceOptions = humanList;
      }

      subraceValue = currentSubraceOptions.first;
    });
  }

  Iterable<String> keys = ["Appearance Generator"];
  Map<String, String> spellMap = {
    "Appearance Generator": "Roll for a new appearance."
  };
  SpellSetGenerator spellGen = SpellSetGenerator();

  updateList() {
    spellGen.init();
    spellMap = spellGen.generateSpellSetMap(
        _RacesDDBState.raceValue, subraceValue, _NumberDDBState.numberValue);
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
                width: MediaQuery.of(ctx).size.width * 0.4,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, MediaQuery.of(ctx).size.height * 0.06, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(ctx).size.height * 0.06,
                            child: Text(
                              '5e Spell Set Generator',
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize:
                                    MediaQuery.of(ctx).size.height * 0.047,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(85, 0, 0, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
                        //      child: SizedBox(
                        //       width: MediaQuery.of(ctx).size.width * 0.4,
                        child: SizedBox(
                          width: MediaQuery.of(ctx).size.width * 0.35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RacesDDB(
                                onRaceChanged: updateSubraceOptions,
                              ),
                              NumberDDB(),
                            ],
                          ),
                        ),
                        //    ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
                        //      child: SizedBox(
                        //       width: MediaQuery.of(ctx).size.width * 0.4,
                        child: SizedBox(
                          width: MediaQuery.of(ctx).size.width * 0.35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SubraceDDB(
                                subraceOptions: currentSubraceOptions,
                                selectedSubrace: subraceValue,
                                onSubraceChanged: handleSubclassChange,
                              ),
                            ],
                          ),
                        ),
                        //    ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
                        child: SizedBox(
                          width: MediaQuery.of(ctx).size.width * 0.35,
                          height: MediaQuery.of(ctx).size.height * 0.125,
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
              Expanded(
                //width: MediaQuery.of(ctx).size.width * 0.58,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(ctx).size.height * 0.73,
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
                                    MediaQuery.of(ctx).size.height * 0.01,
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
                                            MediaQuery.of(ctx).size.height *
                                                0.034),
                                  ),
                                  subtitle: Text(
                                    spellMap[keys.elementAt(index)]!,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(ctx).size.height *
                                                0.03,
                                        fontStyle: FontStyle.italic),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const List<String> dragonbornList = <String>[
  "Any Subrace",
  "Black",
  "Blue",
  "Brass",
  "Bronze",
  "Copper",
  "Gold",
  "Green",
  "Red",
  "Silver",
  "White"
];

const List<String> dwarfList = <String>["Any Subrace","Hill", "Mountain", "Duergar"];

const List<String> humanList = <String>[
  "Any Subrace","Aboriginal",
  "Amerindian",
  "Arab",
  "Asian, Central",
  "Asian, East",
  "Black",
  "Caucasian",
  "Iranian",
  "Indian",
  "Mulatto",
  "Mestizo"
];

const List<String> elfList = <String>[
 "Any Subrace", "High","Wood","Dark","Half-elf"
];

const List<String> gnomeList = <String>[
  "Any Subrace",
  "Deep",
  "Forest",
  "Rock"
];

const List<String> halflingList = <String>[
  "Any Subrace", "Lightfoot", "Stout"
];

const List<String> anyList = <String>[
  "Any Subrace"
];

const List<String> orcList = <String>[
  "Any Subrace",
  "Standard",
  "Half-orc"
];

const List<String> tieflingList = <String>[
  "Baalzebul",
  "Dispater",
  "Fierna",
  "Glasya",
  "Levistus",
  "Mammon",
  "Mephistopheles",
  "Zariel"
];
