import 'package:flutter/material.dart';
import 'package:generator5e/encounters.dart';
import 'package:generator5e/magicitems.dart';
import 'package:generator5e/npcs.dart';
import 'package:generator5e/spellsets.dart';
import 'package:generator5e/traps.dart';
import 'package:generator5e/treasures.dart';
import 'package:generator5e/trinkets.dart';
import 'package:generator5e/wildmagic.dart';

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
  Widget build(BuildContext ctx) {
    double screenWidth = MediaQuery.of(ctx).size.width;
    double screenHeight = MediaQuery.of(ctx).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: const Text(
          'DragonVault',
          style: TextStyle(
            color: Color.fromRGBO(151, 147, 95, 1.0),
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: SizedBox(
                height: 48,
                child: Center(
                    child: Text(
                  '5e Generators',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black54,
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
                                Navigator.push(ctx, TreasuresPage());
                              },
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Treasures',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromRGBO(255, 254, 179, 1.0)),
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
                            Navigator.push(ctx, TrapsPage());
                          },
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'Traps',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 254, 179, 1.0)),
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
                            Navigator.push(ctx, NPCsPage());
                          },
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'Non-Players',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 254, 179, 1.0)),
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
                            Navigator.push(ctx, WildMagicPage());
                          },
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'Wild Magic',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 254, 179, 1.0)),
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
                            backgroundColor: Colors.blueGrey.shade500,
                          ),
                          onPressed: () {
                            Navigator.push(ctx, MagicItemsPage());
                          },
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'Magic Items',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 254, 179, 1.0)),
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
                            backgroundColor: Colors.blueGrey.shade400,
                          ),
                          onPressed: () {
                            Navigator.push(ctx, TrinketsPage());
                          },
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'Trinkets',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 254, 179, 1.0)),
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
                            backgroundColor: Colors.blueGrey.shade300,
                          ),
                          onPressed: () {
                            Navigator.push(ctx, SpellSetsPage());
                          },
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'Spell Sets',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 254, 179, 1.0)),
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
                            backgroundColor: Colors.blueGrey.shade200,
                          ),
                          onPressed: () {
                            Navigator.push(ctx, EncountersPage());
                          },
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'Encounters',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 254, 179, 1.0)),
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
