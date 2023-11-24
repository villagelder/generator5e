import 'package:flutter/material.dart';
import 'package:generator5e/services/magicItemGenerator.dart';
import 'package:generator5e/services/wildMagicService.dart';

import '../../services/abilityScoreGenerator5e.dart';

class WildMagicGenPage extends MaterialPageRoute<void> {
  WildMagicGenPage()
      : super(builder: (BuildContext ctx) {
          return Scaffold(
            backgroundColor: Colors.blueGrey.shade100,
            appBar: AppBar(
              title: const Text(
                'Wild Magic Generator',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  color: Color.fromRGBO(255, 245, 188, 1.0),
                ),
              ),
              backgroundColor: const Color.fromRGBO(57, 0, 0, 1.0),
            ),
            body: const ListViewer(),
          );
        });
}

class MethodDDB extends StatefulWidget {
  const MethodDDB({super.key});

  @override
  State<MethodDDB> createState() => _MethodDDBState();
}

const List<String> methodList = <String>[
  'Wild Magic'
];

class _MethodDDBState extends State<MethodDDB> {
  static String methodValue = methodList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown.shade400,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: const Color.fromRGBO(38, 50, 56, 1.0),
            style: BorderStyle.solid,
            width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.34,
      // height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            dropdownColor: Colors.brown.shade400,
            value: methodValue,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.brown.shade900,
            ),
            elevation: 16,
            style: TextStyle(
              color: Colors.amber.shade100,
              fontFamily: 'Georgia',
              fontSize: MediaQuery.of(context).size.height * 0.04,
              fontWeight: FontWeight.w500,
            ),
            underline: Container(
              height: 2,
              color: Colors.brown.shade900,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                methodValue = value!;
              });
            },
            items: methodList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  String surge = "Roll for Wild Magic Surge";
  WildMagicService wildMagicService = WildMagicService();

  updateList() {
    surge = asg5e.generateDiceRolls(_MethodDDBState.methodValue);

    setState(() {
      surge;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Container(
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
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(ctx).size.width * 0.4,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, MediaQuery.of(ctx).size.height * 0.06, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(ctx).size.height * 0.06,
                            child: Text(
                              '5e Abilities Generator',
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize:
                                    MediaQuery.of(ctx).size.height * 0.047,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(85, 0, 0, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(ctx).size.height * 0.04, 0, 0),
                        child: SizedBox(
                          width: MediaQuery.of(ctx).size.width * 0.34,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MethodDDB(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
                        child: SizedBox(
                          width: MediaQuery.of(ctx).size.width * 0.34,
                          height: MediaQuery.of(ctx).size.height * 0.135,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromRGBO(255, 245, 188, 1.0),
                              backgroundColor:
                                  const Color.fromRGBO(57, 0, 0, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () => updateList(),
                            child: Text(
                              'Generate Ability Scores',
                              style: TextStyle(
                                  fontFamily: 'Georgia',
                                  fontSize:
                                      MediaQuery.of(ctx).size.height * .05,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(ctx).size.width * 0.58,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(ctx).size.height * 0.035, 0, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(ctx).size.height * 0.7,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 2,
                              color: Colors.brown.shade500,
                              child: ListView.builder(
                                key: ObjectKey(diceRollsList[0]),
                                itemCount: diceRollsList.length,
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0,
                                        MediaQuery.of(ctx).size.height * 0.01,
                                        0,
                                        0),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      tileColor: Colors.orange.shade100,
                                      title: Text(
                                        diceRollsList[index],
                                        style: TextStyle(
                                            fontSize:
                                                MediaQuery.of(ctx).size.height *
                                                    0.04),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
