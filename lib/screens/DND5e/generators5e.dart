import 'package:flutter/material.dart';
import 'package:generator5e/screens/DND5e/spellsets.dart';
import 'package:generator5e/screens/DND5e/treasures.dart';
import 'package:generator5e/screens/DND5e/trinkets.dart';
import 'package:generator5e/screens/DND5e/wildmagic.dart';

import 'magicitems.dart';
import 'magicitemstest.dart';
import 'npcs.dart';

class Generators5ePage extends MaterialPageRoute<Null> {
  Generators5ePage()
      : super(builder: (BuildContext context) {
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
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: SizedBox(
                      height: screenHeight * .05,
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
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.27,
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
                                  'Treasure',
                                  style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontSize: screenHeight * 0.025,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          255, 245, 188, 1.0)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.27,
                            height: screenHeight * 0.15,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blueGrey.shade900,
                              ),
                              onPressed: () {
                                Navigator.push(context, MagicItemsPageTest());
                              },
                              child: Text(
                                'Magic Item',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: screenHeight * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(
                                        255, 245, 188, 1.0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.27,
                            height: screenHeight * 0.15,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blueGrey.shade900,
                              ),
                              onPressed: () {
                                Navigator.push(context, TrinketsPage());
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Trinket',
                                  style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontSize: screenHeight * 0.027,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          255, 245, 188, 1.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.27,
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
                                  'Store',
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
                          SizedBox(
                            width: screenWidth * 0.27,
                            height: screenHeight * 0.15,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blueGrey.shade900,
                              ),
                              onPressed: () {
                                Navigator.push(context, NPCsPage());
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'NPC',
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
                          SizedBox(
                            width: screenWidth * 0.27,
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
                                  'Traits',
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.27,
                            height: screenHeight * 0.15,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blueGrey.shade900,
                              ),
                              onPressed: () {
                                Navigator.push(context, SpellSetsPage());
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Spells',
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
                          SizedBox(
                            width: screenWidth * 0.27,
                            height: screenHeight * 0.15,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blueGrey.shade900,
                              ),
                              onPressed: () {
                                Navigator.push(context, WildMagicPage());
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Wild Magic',
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
                          SizedBox(
                            width: screenWidth * 0.27,
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
                                  'Name',
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.27,
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
                                  'Personality',
                                  style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontSize: screenHeight * 0.019,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          255, 245, 188, 1.0)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.27,
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
                                  'Store',
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
                          SizedBox(
                            width: screenWidth * 0.27,
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
                                      fontSize: screenHeight * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          255, 245, 188, 1.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
}
