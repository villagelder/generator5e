import 'package:flutter/material.dart';
import 'package:generator5e/DND5e/encounters.dart';
import 'package:generator5e/DND5e/magicitems.dart';
import 'package:generator5e/DND5e/npcs.dart';
import 'package:generator5e/DND5e/spellsets.dart';
import 'package:generator5e/DND5e/traps.dart';
import 'package:generator5e/DND5e/treasures.dart';
import 'package:generator5e/DND5e/trinkets.dart';
import 'package:generator5e/DND5e/wildmagic.dart';

void main() {
  runApp(const MaterialApp(
    title: 'villagelder',
    // theme: CustomTheme.lightTheme,
    home: MyApp(),
  ));
}

// class CustomTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       backgroundColor: Colors.grey.shade200,
//         primaryColor: Colors.red.shade900,
//         scaffoldBackgroundColor: Colors.amber,
//         fontFamily: 'Georgia',
//         buttonTheme: ButtonThemeData(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//           buttonColor: Colors.red.shade900,
//         ));
//   }
// }

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
          'DragonVault',
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
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 48,
                child: Center(
                    child: Text(
                  '5e Generators',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.05,
                    color: const Color.fromRGBO(38, 50, 56, 1.0),
                  ),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                        child: Center(
                          child: SizedBox(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.15,
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
                                  'Treasures',
                                  style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontSize: screenHeight * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          255, 245, 188, 1.0)),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                      child: Center(
                          child: SizedBox(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: Colors.blueGrey.shade800,
                          ),
                          onPressed: () {
                            Navigator.push(context, TrapsPage());
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Traps',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: screenHeight * 0.035,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(
                                        255, 245, 188, 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                      child: Center(
                          child: SizedBox(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: Colors.blueGrey.shade700,
                          ),
                          onPressed: () {
                            Navigator.push(context, WildMagicPage());
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Wild Magic',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: screenHeight * 0.033,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(
                                        255, 245, 188, 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                      child: Center(
                          child: SizedBox(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: Colors.blueGrey.shade600,
                          ),
                          onPressed: () {
                            Navigator.push(context, NPCsPage());
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'NPCs',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: screenHeight * 0.035,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(
                                        255, 245, 188, 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                      child: Center(
                          child: SizedBox(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: Colors.blueGrey.shade900,
                          ),
                          onPressed: () {
                            Navigator.push(context, MagicItemsPage());
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Magic Items',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: screenHeight * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(
                                        255, 245, 188, 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                      child: Center(
                          child: SizedBox(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: Colors.blueGrey.shade800,
                          ),
                          onPressed: () {
                            Navigator.push(context, TrinketsPage());
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Trinkets',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: screenHeight * 0.035,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(
                                        255, 245, 188, 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                      child: Center(
                          child: SizedBox(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: Colors.blueGrey.shade700,
                          ),
                          onPressed: () {
                            Navigator.push(context, SpellSetsPage());
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Spell Sets',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: screenHeight * 0.035,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(
                                        255, 245, 188, 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                      child: Center(
                          child: SizedBox(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: Colors.blueGrey.shade600,
                          ),
                          onPressed: () {
                            Navigator.push(context, EncountersPage());
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Encounters',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: screenHeight * 0.032,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(
                                        255, 245, 188, 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
