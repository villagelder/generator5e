import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WildMagicPage extends MaterialPageRoute<Null> {
  WildMagicPage()
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
                          '5e Wild Magic',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: screenHeight * 0.044,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(34, 56, 69, 1.0),
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
                        'Randomly determine a Wild Magic surge by pushing \'Generate Surge\'.',
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

class TextChanger extends StatefulWidget {
  const TextChanger({super.key});

  @override
  State<TextChanger> createState() => _TextChangerState();
}

class _TextChangerState extends State<TextChanger> {
  // Declare the variable
  String dynamicText = 'Roll for wild magic surge.';

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
                'Generate Surge',
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
