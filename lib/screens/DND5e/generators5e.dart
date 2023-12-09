import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator5e/screens/DND5e/WildMagicGenerator.dart';
import 'package:generator5e/screens/DND5e/abilityGenerator.dart';
import 'package:generator5e/screens/DND5e/appearances.dart';
import 'package:generator5e/screens/DND5e/merchant.dart';
import 'package:generator5e/screens/DND5e/namesGen.dart';
import 'package:generator5e/screens/DND5e/personalities.dart';
import 'package:generator5e/screens/DND5e/spellsets.dart';
import 'package:generator5e/screens/DND5e/treasuregenerator.dart';
import 'package:generator5e/screens/DND5e/trinketsGenerator.dart';

import 'magicitems.dart';

class Generators5ePage extends MaterialPageRoute<void> {
  Generators5ePage()
      : super(builder: (BuildContext context) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Legendary Generators',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  color: Colors.amber.shade100,
                ),
              ),
              backgroundColor: const Color.fromRGBO(57, 0, 0, 1.0),
            ),
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.amber.shade100,
                      Colors.brown.shade600,
                    ])),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: SizedBox(
                        height: screenHeight * .07,
                        child: Center(
                            child: Text(
                          '5e Generators',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontWeight: FontWeight.w600,
                            fontSize: screenHeight * 0.06,
                            color: const Color.fromRGBO(85, 0, 0, 1),
                          ),
                        )),
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
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(57, 0, 0, 1.0),
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
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(57, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MagicItemsPage());
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Magic Item',
                                    style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(57, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, TrinketsPage());
                                },
                                child: Text(
                                  'Trinket',
                                  style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontSize: screenHeight * 0.044,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber.shade100),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(57, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, TrinketsPage());
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'NPC',
                                    style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
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
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(85, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MerchantPage());
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Merchant',
                                    style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(85, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, AppearancePage());
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Appearance',
                                    style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(85, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, NamesGenPage());
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Name',
                                    style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(85, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, PersonalitiesPage());
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Personality',
                                    style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
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
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(110, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, AbilityGenPage());
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Ability',
                                    style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(110, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, WildMagicGenPage());
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Wild Magic',
                                    style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(110, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, SpellSetsPage());
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Spell Set',
                                    style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.20,
                              height: screenHeight * 0.15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(110, 0, 0, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, TreasuresPage());
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Encounter',
                                    style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: screenHeight * 0.044,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade100),
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
            ),
          );
        });
}
