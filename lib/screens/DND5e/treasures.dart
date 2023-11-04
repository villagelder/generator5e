import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator5e/services/treasureGenerator5e.dart';

class TreasuresPage extends MaterialPageRoute<Null> {
  TreasuresPage()
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
                    padding: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(ctx).size.height * 0.0175, 0, 0),
                    child: SizedBox(
                      height: screenHeight * .05,
                      child: Center(
                        child: Text(
                          '5e Treasure Generator',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: MediaQuery.of(ctx).size.height * 0.044,
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
                      padding: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
                      child: Text(
                        'Select your Challenge Rating and Treasure Type, then push \'Generate Treasure\' to '
                        'generate new treasure. Scroll to the bottom and push the Copy icon to copy the treasure text.',
                        style: TextStyle(
                            fontSize: MediaQuery.of(ctx).size.height * 0.024,
                            fontFamily: 'Georgia',
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

class ChallengeRatingDDB extends StatefulWidget {
  const ChallengeRatingDDB({super.key});

  @override
  State<ChallengeRatingDDB> createState() => _ChallengeRatingDDBState();
}

class TreasureTypeDDB extends StatefulWidget {
  const TreasureTypeDDB({super.key});

  @override
  State<TreasureTypeDDB> createState() => _TreasureTypeDDBState();
}

const List<String> crList = <String>['CR 0-4', 'CR 5-10', 'CR 11-16', 'CR 17+'];
const List<String> trList = <String>['Individual', 'Hoard', 'Legendary'];

class _TreasureTypeDDBState extends State<TreasureTypeDDB> {
  static String ttValue = trList.first;

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
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: ttValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
              color: Color.fromRGBO(38, 50, 56, 1.0),
              fontFamily: 'Georgia',
              fontSize: MediaQuery.of(context).size.height * 0.028,
              fontWeight: FontWeight.w500,
            ),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                ttValue = value!;
              });
            },
            items: trList.map<DropdownMenuItem<String>>((String value) {
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

class _ChallengeRatingDDBState extends State<ChallengeRatingDDB> {
  static String crValue = crList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: crValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            style: TextStyle(
                color: Color.fromRGBO(38, 50, 56, 1.0),
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
                crValue = value!;
              });
            },
            items: crList.map<DropdownMenuItem<String>>((String value) {
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
  TreasureGenerator5e trGen = TreasureGenerator5e();
  String dynamicText = 'Roll for treasure.';

  updateText() {
    dynamicText = trGen
        .generate(
            _ChallengeRatingDDBState.crValue, _TreasureTypeDDBState.ttValue)
        .toString();
    setState(() {
      dynamicText;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(ctx).size.height * 0.015, 0, 0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChallengeRatingDDB(),
              TreasureTypeDDB(),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(ctx).size.width * 0.06, 0, 0),
            child: SizedBox(
              width: MediaQuery.of(ctx).size.width * 0.863,
              height: MediaQuery.of(ctx).size.width * 0.18,
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
                  'Generate Treasure',
                  style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: MediaQuery.of(ctx).size.height * .035,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(ctx).size.width * 0.07,
                MediaQuery.of(ctx).size.height * 0.03,
                MediaQuery.of(ctx).size.width * 0.07,
                0),
            child: Text(dynamicText,
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: MediaQuery.of(ctx).size.height * 0.03,
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 36, 0, 0),
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
      ),
    );
  }
}
