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
  final String selectedSubclass;
  final ValueChanged<String> onSubclassChanged;

  const SubclassDDB(
      {super.key,
      required this.subclassOptions,
      required this.selectedSubclass,
      required this.onSubclassChanged});

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

const List<String> classList = <String>[
  'Any Caster',
  'Artificer',
  'Bard',
  'Cleric',
  'Druid',
  'Fighter',
  'Paladin',
  'Ranger',
  'Rogue',
  'Sorcerer',
  'Warlock',
  'Wizard'
];

const List<String> subclassList = <String>['Choose a Subclass'];

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

class _ClassesDDBState extends State<ClassesDDB> {
  static String classValue = classList.first;

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
            value: classValue,
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
                classValue = newValue!;
              });
              widget.onClassChanged(
                  newValue!); // Notify the parent widget of the change
            },
            items: classList.map<DropdownMenuItem<String>>((String value) {
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

class _SubclassDDBState extends State<SubclassDDB> {
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
              value: widget.selectedSubclass,
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
                widget.onSubclassChanged(newValue!);
                // setState(() {
                //   subclassValue = newValue!;
                // });
              },
              items: widget.subclassOptions
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
  List<String> currentSubclassOptions = subclassList;
  String selectedClass = classList.first;
  String subclassValue = subclassList.first;

  void handleSubclassChange(String newSubclass) {
    setState(() {
      subclassValue = newSubclass;
    });
  }

  void updateSubclassOptions(String newClass) {
    setState(() {
      selectedClass = newClass;
      switch (newClass) {
        case "Artificer":
          currentSubclassOptions = artificerList;
          break;
        case "Bard":
          currentSubclassOptions = collegeList;
          break;
        case "Cleric":
          currentSubclassOptions = domainList;
          break;
        case "Druid":
          currentSubclassOptions = circleList;
          break;
        case "Fighter":
          currentSubclassOptions = figherCasterList;
          break;
        case "Paladin":
          currentSubclassOptions = paladinList;
          break;
        case "Ranger":
          currentSubclassOptions = rangerList;
          break;
        case "Rogue":
          currentSubclassOptions = rogueList;
          break;
        case "Sorcerer":
          currentSubclassOptions = sorcererList;
          break;
        case "Warlock":
          currentSubclassOptions = warlockList;
          break;
        case "Wizard":
          currentSubclassOptions = arcaneList;
          break;
        default:
          currentSubclassOptions = subclassList;
      }

      subclassValue = currentSubclassOptions.first;
    });
  }

  Iterable<String> keys = ["Spell Set Generator"];
  Map<String, String> spellMap = {
    "Spell Set Generator": "Roll for a new spell set."
  };
  SpellSetGenerator spellGen = SpellSetGenerator();

  updateList() {
    spellGen.init();
    spellMap = spellGen.generateSpellSetMap(_ClassesDDBState.classValue,
        subclassValue, _NumberDDBState.numberValue);
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
                              ClassesDDB(
                                onClassChanged: updateSubclassOptions,
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
                              SubclassDDB(
                                subclassOptions: currentSubclassOptions,
                                selectedSubclass: subclassValue,
                                onSubclassChanged: handleSubclassChange,
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
                                                    0.036),
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

const List<String> arcaneList = <String>[
  'School of Abjuration',
  'Bladesinging',
  'School of Conjuration',
  'School of Divination',
  'School of Enchantment',
  'School of Evocation',
  'School of Illusion',
  'School of Necromancy',
  'Order of Scribes',
  'School of Transmutation',
  'School of War'
];

const List<String> collegeList = <String>[
  'College of Creation',
  'College of Eloquence',
  'College of Glamour',
  'College of Lore',
  'College of Spirits',
  'College of Swords',
  'College of Tragedy',
  'College of War',
  'College of Whispers'
];

const List<String> domainList = <String>[
  'Arcana Domain',
  'Blood Domain',
  'Death Domain',
  'Forge Domain',
  'Grave Domain',
  'Knowledge Domain',
  'Life Domain',
  'Light Domain',
  'Moon Domain',
  'Nature Domain',
  'Order Domain',
  'Peace Domain',
  'Tempest Domain',
  'Trickery Domain',
  'Twighlight Domain',
  'War Domain'
];

const List<String> circleList = <String>[
  'Circle of the Blighted',
  'Circle of Dreams',
  'Circle of the Land',
  'Circle of the Moon',
  'Circle of the Shepherd',
  'Circle of Spores',
  'Circle of Stars',
  'Circle of Wildfire'
];

const List<String> artificerList = <String>[
  'Alchemist',
  'Armorer',
  'Artillerist',
  'Battle Smith'
];

const List<String> figherCasterList = <String>['Eldritch Knight'];

const List<String> paladinList = <String>[
  'Oath of the Ancients',
  'Oath of Conquest',
  'Oath of the Crown',
  'Oath of Devotion',
  'Oath of Glory',
  'Oathbreaker',
  'Oath of Redemption',
  'Oath of Vengeance',
  'Oath of the Watchers'
];

const List<String> rangerList = <String>[
  'Beast Master',
  'Drakewarden',
  'Fey Wanderer',
  'Gloom Stalker',
  'Horizon Walker',
  'Hunter',
  'Monster Slayer',
  'Swarm Keeper'
];

const List<String> warlockList = <String>[
  'The Archfey',
  'The Celestial',
  'The Fathomless',
  'The Fiend',
  'The Genie',
  'The Great Old One',
  'The Hexblade',
  'The Undead',
  'The Undying'
];

const List<String> sorcererList = <String>[
  'Aberrant Mind',
  'Clockwork Soul',
  'Divine Soul',
  'Draconic Bloodline',
  'Lunar Magic',
  'Runechild',
  'Shadow Magic',
  'Storm Magic',
  'Wild Magic'
];
const List<String> rogueList = <String>['Arcane Trickster'];
