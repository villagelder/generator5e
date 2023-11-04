import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator5e/services/magicItemGenerator.dart';


class TrapsPage extends MaterialPageRoute {
  TrapsPage()
      : super(builder: (BuildContext ctx) {

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: const Text(
          'DragonVault',
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
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0),
              child: SizedBox(
                height: 48,
                child: Center(
                  child: Text(
                    '5e Traps & Hazards',
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(34, 56, 69, 1.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(ctx).size.width * 0.84,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  'Select the party level, trap threat level, and the category of trap or hazard, then push \'Generate\' to '
                      'get your traps and hazards.',
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

class ThreatDDB extends StatefulWidget {
  const ThreatDDB({super.key});

  @override
  State<ThreatDDB> createState() => _ThreatDDBState();
}

class TrapTypeDDB extends StatefulWidget {
  const TrapTypeDDB({super.key});

  @override
  State<TrapTypeDDB> createState() => _TrapTypeDDBState();
}

class PartyLevelDDB extends StatefulWidget {
  const PartyLevelDDB({super.key});

  @override
  State<PartyLevelDDB> createState() => _PartyLevelDDBState();
}

const List<String> partyLevelList = <String>[
  '1-4',
  '5-10',
  '11-16',
  '17-20',
  '21+'
];
const List<String> trapTypeList = <String>[
  'All Traps & Hazards',
  'Simple Trap',
  'Complex Trap',
  'Mechanical Trap',
  'Magical Trap',
  'Hazard',
  'Wilderness Hazard',
  'Weather',
  'Eldritch Storm'];

const List<String> threatList = <String>['Setback', 'Dangerous', 'Deadly', 'Catastrophic'];

class _PartyLevelDDBState extends State<PartyLevelDDB> {
  static String levelValue = partyLevelList.first;

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
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: levelValue,
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
                levelValue = value!;
              });
            },
            items: partyLevelList.map<DropdownMenuItem<String>>((String value) {
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

class _ThreatDDBState extends State<ThreatDDB> {
  static String threatValue = threatList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: threatValue,
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
                threatValue = value!;
              });
            },
            items: threatList.map<DropdownMenuItem<String>>((String value) {
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

class _TrapTypeDDBState extends State<TrapTypeDDB> {
  static String typeValue = trapTypeList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.84,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: typeValue,
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
                typeValue = value!;
              });
            },
            items: trapTypeList.map<DropdownMenuItem<String>>((String value) {
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
  String dynamicText = 'Roll for traps.';
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
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PartyLevelDDB(),
              ThreatDDB(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              TrapTypeDDB(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(ctx).size.height * 0.0175, 0, 0),
          child: SizedBox(
            width: MediaQuery.of(ctx).size.width * 0.84,
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
                'Generate Trap or Hazard',
                style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: MediaQuery.of(ctx).size.height * .035,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(40.0),
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
