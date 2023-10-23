import 'package:flutter/material.dart';
import 'package:generator5e/treasures.dart';
import 'package:generator5e/traps.dart';
import 'package:generator5e/npcs.dart';
import 'package:generator5e/trinkets.dart';
import 'package:generator5e/wildmagic.dart';
import 'package:generator5e/magicitems.dart';
import 'package:generator5e/spellsets.dart';
import 'package:generator5e/encounters.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
    ));
}

const ImageProvider image = AssetImage('assets/images/trapNetR.jpg');

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext ctx) {
  return Scaffold(
    backgroundColor: const Color.fromRGBO(210, 210, 172, 1.0),
    appBar: AppBar(
      title: const Text(
        'DragonVault',
        style: TextStyle(
          color: Color.fromRGBO(210, 210, 172, 1.0),
        ),
      ),
      backgroundColor: const Color.fromRGBO(34, 56, 69, 1.0),
    ),
    body: Center(
      child: ListView(
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
                      color: Color.fromRGBO(34, 56, 69, 1.0),
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
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Center(
                        child: Ink.image(
                          image: AssetImage('assets/images/trapNetR.jpg'),
                          fit: BoxFit.cover,
                          width: 160,
                          height: 104,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(ctx, TreasuresPage()); },
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Treasures', style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(
                                        214, 211, 152, 1.0)),),
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                child: Center(
                  child: Ink.image(
                    image: AssetImage('assets/images/trapNetR.jpg'),
                    fit: BoxFit.cover,
                    width: 160,
                    height: 104,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(ctx, TrapsPage()); },
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Traps', style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(
                              214, 211, 152, 1.0)),),
                        ),
                      ),
                      ),
                  )
                ),
              ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                    child: Center(
                        child: Ink.image(
                          image: AssetImage('assets/images/trapNetR.jpg'),
                          fit: BoxFit.cover,
                          width: 160,
                          height: 104,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(ctx, NPCsPage()); },
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('NPCs', style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(
                                        214, 211, 152, 1.0)),),
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                    child: Center(
                        child: Ink.image(
                          image: AssetImage('assets/images/trapNetR.jpg'),
                          fit: BoxFit.cover,
                          width: 160,
                          height: 104,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(ctx, WildMagicPage()); },
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Wild Magic', style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(
                                        214, 211, 152, 1.0)),),
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                    child: Center(
                        child: Ink.image(
                          image: AssetImage('assets/images/trapNetR.jpg'),
                          fit: BoxFit.cover,
                          width: 160,
                          height: 104,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(ctx, MagicItemsPage()); },
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Magic Items', style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(
                                        214, 211, 152, 1.0)),),
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                    child: Center(
                        child: Ink.image(
                          image: AssetImage('assets/images/trapNetR.jpg'),
                          fit: BoxFit.cover,
                          width: 160,
                          height: 104,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(ctx, TrinketsPage()); },
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Trinkets', style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(
                                        214, 211, 152, 1.0)),),
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                    child: Center(
                        child: Ink.image(
                          image: AssetImage('assets/images/trapNetR.jpg'),
                          fit: BoxFit.cover,
                          width: 160,
                          height: 104,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(ctx, SpellSetsPage()); },
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Spell Sets', style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(
                                        214, 211, 152, 1.0)),),
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                    child: Center(
                        child: Ink.image(
                          image: AssetImage('assets/images/trapNetR.jpg'),
                          fit: BoxFit.cover,
                          width: 160,
                          height: 104,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(ctx, EncountersPage()); },
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Encounters', style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(
                                        214, 211, 152, 1.0)),),
                              ),
                            ),
                          ),
                        )
                    ),
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
