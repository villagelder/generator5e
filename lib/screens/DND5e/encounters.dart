import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/magicItemGenerator.dart';

class EncountersPage extends MaterialPageRoute<Null> {
  EncountersPage()
      : super(builder: (BuildContext ctx) {
          double screenWidth = MediaQuery.of(ctx).size.width;
          double screenHeight = MediaQuery.of(ctx).size.height;
          return Scaffold(
            backgroundColor: Colors.blueGrey.shade100,
            appBar: AppBar(
              title: const Text(
                'DragonVault Generators',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  color: Color.fromRGBO(255, 245, 188, 1.0),
                ),
              ),
              backgroundColor: const Color.fromRGBO(57, 0, 0, 1.0),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 0),
                    child: SizedBox(
                      height: screenHeight * .05,
                      child: Center(
                        child: Text(
                          '5e Encounter Generator',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: MediaQuery.of(ctx).size.height * 0.044,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(34, 56, 69, 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(ctx).size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                      child: Text(
                        'Choose your options for your new NPC and push \'Generate NPC\'.',
                        style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: MediaQuery.of(ctx).size.height * 0.022,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const TextChanger(),
                ],
              ),
            ),
          );
        });
}

//Encounter

class NpcDDB extends StatefulWidget {
  const NpcDDB({super.key});

  @override
  State<NpcDDB> createState() => _NpcDDBState();
}

class AlignmentDDB extends StatefulWidget {
  const AlignmentDDB({super.key});

  @override
  State<AlignmentDDB> createState() => _AlignmentDDBState();
}

class AgeDDB extends StatefulWidget {
  const AgeDDB({super.key});

  @override
  State<AgeDDB> createState() => _AgeDDBState();
}

class RaceDDB extends StatefulWidget {
  const RaceDDB({super.key});

  @override
  State<RaceDDB> createState() => _RaceDDBState();
}

class GenderDDB extends StatefulWidget {
  const GenderDDB({super.key});

  @override
  State<GenderDDB> createState() => _GenderDDBState();
}

const List<String> alignList = <String>['Any Align', 'Good', 'Neutral', 'Evil'];

const List<String> raceList = <String>[
  'Any Race',
  'Human',
  'Classic',
  'Small Race',
  '5e Realms',
  'Monstrous'
];

const List<String> genderList = <String>[
  'Any Gender',
  'Male',
  'Female',
  'Male or Female',
  'LGBTQIA+'
];
const List<String> ageList = <String>[
  'Any Age',
  'Child',
  'Adolescent',
  'Adult',
  'Elder',
  'Venerable'
];

const List<String> npcList = <String>[
  'Any Pursuit',
  'Artisan',
  'Commoner',
  'Militia',
  'Nobility',
  'Outlaw',
  'Performer',
  'Scholar',
  'Villain'
];

class _AgeDDBState extends State<AgeDDB> {
  static String ageValue = ageList.first;

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
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: ageValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
              color: const Color.fromRGBO(38, 50, 56, 1.0),
              fontFamily: 'Georgia',
              fontSize: MediaQuery.of(context).size.height * 0.025,
              fontWeight: FontWeight.w500,
            ),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                ageValue = value!;
              });
            },
            items: ageList.map<DropdownMenuItem<String>>((String value) {
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

class _RaceDDBState extends State<RaceDDB> {
  static String raceValue = raceList.first;

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
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: raceValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
              color: const Color.fromRGBO(38, 50, 56, 1.0),
              fontFamily: 'Georgia',
              fontSize: MediaQuery.of(context).size.height * 0.025,
              fontWeight: FontWeight.w500,
            ),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                raceValue = value!;
              });
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

class _GenderDDBState extends State<GenderDDB> {
  static String genderValue = genderList.first;

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
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: genderValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
              color: const Color.fromRGBO(38, 50, 56, 1.0),
              fontFamily: 'Georgia',
              fontSize: MediaQuery.of(context).size.height * 0.025,
              fontWeight: FontWeight.w500,
            ),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                genderValue = value!;
              });
            },
            items: genderList.map<DropdownMenuItem<String>>((String value) {
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

class _NpcDDBState extends State<NpcDDB> {
  static String numberValue = npcList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.075,
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
                fontSize: MediaQuery.of(context).size.height * 0.025,
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
            items: npcList.map<DropdownMenuItem<String>>((String value) {
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
  static String alignValue = alignList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: alignValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
                color: const Color.fromRGBO(38, 50, 56, 1.0),
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                alignValue = value!;
              });
            },
            items: alignList.map<DropdownMenuItem<String>>((String value) {
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

class TextChanger extends StatefulWidget {
  const TextChanger({super.key});

  @override
  State<TextChanger> createState() => _TextChangerState();
}

class _TextChangerState extends State<TextChanger> {
  // Declare the variable
  String dynamicText = 'Roll your NPC.';
  MagicItemGenerator5e mig = MagicItemGenerator5e();

  updateText() {
    setState(() {
      dynamicText = 'changed';
      // dynamicText = trGen
      //     .generate(_RarityDDBState.crValue, _TreasureTypeDDBState.ttValue)
      //     .toString();
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaceDDB(),
              AgeDDB(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GenderDDB(),
              AlignmentDDB(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NpcDDB(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(ctx).size.height * 0.0175, 0, 0),
          child: SizedBox(
            width: MediaQuery.of(ctx).size.width * 0.9,
            height: MediaQuery.of(ctx).size.height * 0.1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(255, 245, 188, 1.0),
                backgroundColor: Colors.lightGreen.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () => updateText(),
              child: Text(
                'Generate NPC',
                style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: MediaQuery.of(ctx).size.height * .035,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text(dynamicText,
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(ctx).size.height * 0.03,
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
          child: IconButton(
            iconSize: 36,
            icon: const Icon(Icons.copy),
            color: Colors.blueGrey.shade900,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: dynamicText));
            },
          ),
        ),
      ],
    );
  }
}

//stats, personality, features
//PersonalityCheckbox, FeaturesCheckbox(), StatsCheckbox

class DetailsCheckbox extends StatefulWidget {
  const DetailsCheckbox({super.key});

  @override
  State<DetailsCheckbox> createState() => _DetailsCheckboxState();
}

class _DetailsCheckboxState extends State<DetailsCheckbox> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .60,
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text("Details", textAlign: TextAlign.right),
        value: isChecked,
        activeColor: Colors.green,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value;
          });
        },
      ),
    );
  }
}

class PersonalityCheckbox extends StatefulWidget {
  const PersonalityCheckbox({super.key});

  @override
  State<PersonalityCheckbox> createState() => _PersonalityCheckboxState();
}

class _PersonalityCheckboxState extends State<PersonalityCheckbox> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .60,
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.platform,
          contentPadding: EdgeInsets.zero,
          title: const Text("Traits", textAlign: TextAlign.right),
          value: isChecked,
          activeColor: Colors.green,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
      ),
    );
  }
}

class StatsCheckbox extends StatefulWidget {
  const StatsCheckbox({super.key});

  @override
  State<StatsCheckbox> createState() => _StatsCheckboxState();
}

class _StatsCheckboxState extends State<StatsCheckbox> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .60,
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text("Stats", textAlign: TextAlign.right),
        value: isChecked,
        activeColor: Colors.green,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value;
          });
        },
      ),
    );
  }
}
