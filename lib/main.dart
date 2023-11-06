import 'package:flutter/material.dart';
import 'package:generator5e/screens/DND5e/generators5e.dart';
import 'package:generator5e/screens/DND5e/treasures.dart';

void main() {
  runApp(const MaterialApp(
    title: 'villagelder',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, screenHeight * .05, 0, 0),
              child: SizedBox(
                height: screenHeight * .07,
                child: Center(
                    child: Text(
                  'DragonVault',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.05,
                    color: const Color.fromRGBO(38, 50, 56, 1.0),
                  ),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, screenHeight * .03, 0, 0),
              child: SizedBox(
                width: screenWidth * 0.7,
                height: screenHeight * 0.175,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.blueGrey.shade900,
                  ),
                  onPressed: () {
                    Navigator.push(context, TreasuresPage());
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '5e Characters',
                      style: TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: screenHeight * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(255, 245, 188, 1.0)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, screenHeight * .03, 0, 0),
              child: SizedBox(
                width: screenWidth * 0.7,
                height: screenHeight * 0.175,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.blueGrey.shade900,
                  ),
                  onPressed: () {
                    Navigator.push(context, Generators5ePage());
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '5e Generators',
                      style: TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: screenHeight * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(255, 245, 188, 1.0)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, screenHeight * .03, 0, 0),
              child: SizedBox(
                width: screenWidth * 0.7,
                height: screenHeight * 0.175,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.blueGrey.shade900,
                  ),
                  onPressed: () {
                    Navigator.push(context, TreasuresPage());
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Other Fantasy Generators',
                      style: TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: screenHeight * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(255, 245, 188, 1.0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
