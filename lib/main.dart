import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator5e/screens/DND5e/generators5e.dart';
import 'package:generator5e/screens/DND5e/treasuregenerator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
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
                padding: EdgeInsets.fromLTRB(0, screenHeight * .05, 0, 0),
                child: SizedBox(
                  height: screenHeight * .07,
                  child: Center(
                      child: Text(
                    'Legendary Generators',
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontWeight: FontWeight.w600,
                      fontSize: screenHeight * 0.06,
                      color: const Color.fromRGBO(85, 0, 0, 1),
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
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: const Color.fromRGBO(57, 0, 0, 1.0),
                    ),
                    onPressed: () {
                      Navigator.push(context, Generators5ePage());
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('5e Generators',
                          style: TextStyle(
                              fontFamily: 'Georgia',
                              fontSize: screenHeight * 0.06,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber
                                  .shade100)), //const Color.fromRGBO(255, 245, 188, 1.0)),
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
                      backgroundColor: const Color.fromRGBO(85, 0, 0, 1.0),
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
                            fontSize: screenHeight * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade100),
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
                      backgroundColor: const Color.fromRGBO(110, 0, 0, 1.0),
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
                            fontSize: screenHeight * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
