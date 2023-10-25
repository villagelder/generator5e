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
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext ctx) {
    double screenWidth = MediaQuery.of(ctx).size.width;
    double screenHeight = MediaQuery.of(ctx).size.height;

    return Scaffold(
      //backgroundColor: const Color.fromRGBO(210, 210, 172, 1.0),
      appBar: AppBar(
        title: const Text(
          'DragonVault',
          style: TextStyle(
              //  color: Color.fromRGBO(210, 210, 172, 1.0),
              ),
        ),
        // backgroundColor: const Color.fromRGBO(34, 56, 69, 1.0),
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
                    fontSize: 32,
                    //   color: Color.fromRGBO(34, 56, 69, 1.0),
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
                                          Color.fromRGBO(214, 211, 152, 1.0)),
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
                                    color: Color.fromRGBO(214, 211, 152, 1.0)),
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
                                    color: Color.fromRGBO(214, 211, 152, 1.0)),
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
                                    color: Color.fromRGBO(214, 211, 152, 1.0)),
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
                                    color: Color.fromRGBO(214, 211, 152, 1.0)),
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
                                    color: Color.fromRGBO(214, 211, 152, 1.0)),
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
                                    color: Color.fromRGBO(214, 211, 152, 1.0)),
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
                                    color: Color.fromRGBO(214, 211, 152, 1.0)),
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
