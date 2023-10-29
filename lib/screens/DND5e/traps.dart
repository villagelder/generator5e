import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrapsPage extends MaterialPageRoute {
  TrapsPage()
      : super(builder: (BuildContext ctx) {
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
                children: const [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          '5e Traps',
                          style: TextStyle(
                            fontSize: 32,
                            color: Color.fromRGBO(34, 56, 69, 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
}
