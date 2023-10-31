import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator5e/services/treasureGenerator5e.dart';

import '../../models/treasures.dart';

class TreasuresPage extends MaterialPageRoute<Null> {
  TreasuresPage()
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
                          '5e Treasure Generator',
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
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
                      child: Text(
                        'Select your Challenge Rating and Treasure Type, then push \'Generate Treasure\' to '
                        'generate new treasure. Scroll to the bottom and push the Copy icon to copy the treasure text.',
                        style: TextStyle(
                            fontFamily: 'Georgia', fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  TextChanger(),
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
const List<String> trList = <String>['Individual', 'Hoard'];

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
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: ttValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: const TextStyle(
              color: Color.fromRGBO(38, 50, 56, 1.0),
              fontFamily: 'Georgia',
              fontSize: 20,
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
  static String CRValue = crList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: CRValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: const TextStyle(
                color: Color.fromRGBO(38, 50, 56, 1.0),
                fontFamily: 'Georgia',
                fontSize: 20,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                CRValue = value!;
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
  String dynamicText = 'Roll for treasure.';
  TreasureGenerator5e trGen = TreasureGenerator5e();

  updateText() {
    setState(() {
      dynamicText = trGen.generate(_ChallengeRatingDDBState.CRValue, _TreasureTypeDDBState.ttValue).toString();

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
              ChallengeRatingDDB(),
              TreasureTypeDDB(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
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
              child: const Text(
                'Generate Treasure',
                style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text(dynamicText,
              
              style: const TextStyle(fontFamily: 'Georgia', fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
          child: Icon(
            Icons.copy,
            color: Colors.blueGrey.shade900,
            size: 40.0,
          ),
        ),
      ],
    );
  }
}
