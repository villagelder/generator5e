import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
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
          padding: const EdgeInsets.all(12),
          children: [
            const SizedBox(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(115, 37, 38, 1.0),
                    padding: const EdgeInsets.all(14.0)),
                child: const Text(
                  'Treasures',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(214, 211, 152, 1.0),
                      letterSpacing: 2.5),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(115, 37, 38, 1.0),
                    padding: const EdgeInsets.all(14.0)),
                child: const Text(
                  'Magic Items',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(214, 211, 152, 1.0),
                      letterSpacing: 2.5),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(115, 37, 38, 1.0),
                    padding: const EdgeInsets.all(14.0)),
                child: const Text(
                  'NPCs',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(214, 211, 152, 1.0),
                      letterSpacing: 2.5),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(115, 37, 38, 1.0),
                    padding: const EdgeInsets.all(14.0)),
                child: const Text(
                  'Traps',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(214, 211, 152, 1.0),
                      letterSpacing: 2.5),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(115, 37, 38, 1.0),
                    padding: const EdgeInsets.all(14.0)),
                child: const Text(
                  'Encounters',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(214, 211, 152, 1.0),
                      letterSpacing: 2.5),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(115, 37, 38, 1.0),
                    padding: const EdgeInsets.all(14.0)),
                child: const Text(
                  'Spell Sets',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(214, 211, 152, 1.0),
                      letterSpacing: 2.5),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}
