import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator5e/services/trinketGenerator.dart';

class TrinketsPage extends MaterialPageRoute<void> {
  TrinketsPage()
      : super(builder: (BuildContext ctx) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
          // double screenWidth = MediaQuery.of(ctx).size.width;
          // double screenHeight = MediaQuery.of(ctx).size.height;

          return Scaffold(
            backgroundColor: Colors.blueGrey.shade100,
            appBar: AppBar(
              title: const Text(
                'Legendary Generators',
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

class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  TrinketGenerator trinketGen = TrinketGenerator();
  List<String> trinketList = ['Roll for trinkets'];

  updateList() {
    trinketList = trinketGen.generateTrinketsArray(
        _ItemTypeDDBState.typeValue, _NumberDDBState.numberValue);
    setState(() {
      trinketList;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(ctx).size.width * 0.4,
              height: MediaQuery.of(ctx).size.width * 0.44,
              child: Padding(
                padding:  EdgeInsets.fromLTRB(20, MediaQuery.of(ctx).size.height * 0.04, 20, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(ctx).size.height * 0.044,
                          child: Text(
                            '5e Trinket Generator',
                            style: TextStyle(
                              fontFamily: 'Georgia',
                              fontSize: MediaQuery.of(ctx).size.height * 0.044,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(34, 56, 69, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                     Padding(
                      padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(ctx).size.height * 0.06, 0, 0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemTypeDDB(),
                          NumberDDB(),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(ctx).size.height * 0.03, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.of(ctx).size.width * 0.34,
                        height: MediaQuery.of(ctx).size.height * 0.135,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                const Color.fromRGBO(255, 245, 188, 1.0),
                            backgroundColor: Colors.lightGreen.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () => updateList(),
                          child: Text(
                            'Generate Trinkets',
                            style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: MediaQuery.of(ctx).size.height * .04,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    //   child: IconButton(
                    //     iconSize: 36,
                    //     icon: const Icon(Icons.copy),
                    //     color: Colors.blueGrey.shade900,
                    //     onPressed: () {
                    //       Clipboard.setData(
                    //           ClipboardData(text: trinketList.toString()));
                    //     },
                    //   ),
                    // ),
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
                          height: MediaQuery.of(ctx).size.height * 0.75,
                          child: Card(
                            elevation: 0,
                            color: Colors.blueGrey.shade100,
                            child: ListView.builder(
                              key: ObjectKey(trinketList[0]),
                              itemCount: trinketList.length,
                              itemBuilder: (ctx, index) {
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0,
                                      MediaQuery.of(ctx).size.height * 0.01,
                                      0,
                                      0),
                                  child: ListTile(
                                    title: Text(trinketList[index]),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: const BorderSide(
                                          width: 1.5,
                                          color: Color.fromRGBO(0, 102, 0, 1)),
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
    );
  }
}

//           double screenHeight = MediaQuery.of(ctx).size.height;
//           return Scaffold(
//             backgroundColor: Colors.blueGrey.shade100,
//             appBar: AppBar(
//               title: const Text(
//                 'DragonVault Generators',
//                 style: TextStyle(
//                   fontFamily: 'Georgia',
//                   color: Color.fromRGBO(255, 245, 188, 1.0),
//                 ),
//               ),
//               backgroundColor: const Color.fromRGBO(57, 0, 0, 1.0),
//             ),
//             body: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 0),
//                   child: SizedBox(
//                     height: screenHeight * .05,
//                     child: Center(
//                       child: Text(
//                         '5e Trinket Generator',
//                         style: TextStyle(
//                           fontFamily: 'Georgia',
//                           fontSize: screenHeight * 0.044,
//                           fontWeight: FontWeight.w500,
//                           color: const Color.fromRGBO(34, 56, 69, 1.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                     width: MediaQuery.of(ctx).size.width * 0.84,
//                     child: const Padding(
//                       padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
//                       child: ListViewer(),
//                     )),
//               ],
//             ),
//           );
//         });
// }
//
// TrinketGenerator tg = TrinketGenerator();
//
class NumberDDB extends StatefulWidget {
  const NumberDDB({super.key});

  @override
  State<NumberDDB> createState() => _NumberDDBState();
}

class ItemTypeDDB extends StatefulWidget {
  const ItemTypeDDB({super.key});

  @override
  State<ItemTypeDDB> createState() => _ItemTypeDDBState();
}

const List<String> itemTypeList = <String>[
  'Any Trinket',
  'Macabre',
  'Martial',
  'Mystical',
  'Nature',
  'Religious',
  'Romantic',
  'Scholarly',
  'Sentimental',
  'Traveler',
  "Whimsical"
];
const List<String> numberList = <String>['1', '2', '3', '5', '8', '13'];

class _NumberDDBState extends State<NumberDDB> {
  static String numberValue = numberList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.115,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: numberValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
                color: const Color.fromRGBO(38, 50, 56, 1.0),
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.035,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                numberValue = value!;
              });
            },
            items: numberList.map<DropdownMenuItem<String>>((String value) {
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

class _ItemTypeDDBState extends State<ItemTypeDDB> {
  static String typeValue = itemTypeList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.215,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: typeValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
                color: const Color.fromRGBO(38, 50, 56, 1.0),
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.035,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                typeValue = value!;
              });
            },
            items: itemTypeList.map<DropdownMenuItem<String>>((String value) {
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

// class ListViewer extends StatefulWidget {
//   const ListViewer({super.key});
//
//   @override
//   State<ListViewer> createState() => _ListViewerState();
// }
//
// class _ListViewerState extends State<ListViewer> {
//   // Declare the variable
//   List<String> trinketsList = ['Trinkets'];
//   TrinketGenerator trinketGenerator = TrinketGenerator();
//
//   updateList() {
//     trinketsList = trinketGenerator.generateTrinketsArray(
//         _ItemTypeDDBState.typeValue, _NumberDDBState.numberValue);
//     setState(() {
//       trinketsList;
//     });
//   }
//
//   @override
//   Widget build(BuildContext ctx) {
//     return Column(
//       children: [
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ItemTypeDDB(),
//             NumberDDB(),
//           ],
//         ),
//
//         Padding(
//           padding: EdgeInsets.fromLTRB(
//               0, MediaQuery.of(ctx).size.height * 0.0175, 0, 0),
//           child: SizedBox(
//             width: MediaQuery.of(ctx).size.width * 0.84,
//             height: MediaQuery.of(ctx).size.height * 0.1,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: const Color.fromRGBO(255, 245, 188, 1.0),
//                 backgroundColor: Colors.lightGreen.shade900,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               onPressed: () => updateList(),
//               child: Text(
//                 'Generate Trinket',
//                 style: TextStyle(
//                     fontFamily: 'Georgia',
//                     fontSize: MediaQuery.of(ctx).size.height * .035,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(
//               0, MediaQuery.of(ctx).size.height * 0.0175, 0, 0),
//           child: Column(
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(ctx).size.width * 0.86,
//                 height: MediaQuery.of(ctx).size.height * 0.55,
//                 child: Card(
//                   elevation: 0,
//                   color: Colors.blueGrey.shade100,
//                   child: ListView.builder(
//                     key: ObjectKey(trinketsList[0]),
//                     itemCount: trinketsList.length,
//                     itemBuilder: (ctx, index) {
//                       return Padding(
//                         padding: EdgeInsets.fromLTRB(
//                             0, MediaQuery.of(ctx).size.height * 0.01, 0, 0),
//                         child: ListTile(
//                           title: Text(trinketsList[index]),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             side: const BorderSide(
//                                 width: 1.5,
//                                 color: Color.fromRGBO(0, 102, 0, 1)),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         // Padding(
//         //   padding: EdgeInsets.all(40.0),
//         //   child: Text(dynamicText,
//         //       style: TextStyle(
//         //         fontFamily: 'Georgia',
//         //         fontSize: MediaQuery.of(ctx).size.height * 0.03,
//         //       )),
//         // ),
//         // Padding(
//         //   padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
//         //   child: IconButton(
//         //     iconSize: 36,
//         //     icon: const Icon(Icons.copy),
//         //     color: Colors.blueGrey.shade900,
//         //     onPressed: () {
//         //       Clipboard.setData(ClipboardData(text: trinketsList.toString()));
//         //     },
//         //   ),
//         // ),
//       ],
//     );
//   }
// }
//
// class TextChanger extends StatefulWidget {
//   const TextChanger({super.key});
//
//   @override
//   State<TextChanger> createState() => _TextChangerState();
// }
//
// class _TextChangerState extends State<TextChanger> {
//   // Declare the variable
//   String dynamicText = 'Roll for trinket.';
//   TrinketGenerator trinketGenerator = TrinketGenerator();
//
//   updateText() {
//     dynamicText = trinketGenerator.generateTrinkets(
//         _ItemTypeDDBState.typeValue, _NumberDDBState.numberValue);
//     setState(() {
//       dynamicText;
//     });
//   }
//
//   @override
//   Widget build(BuildContext ctx) {
//     return Column(
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(12.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ItemTypeDDB(),
//               NumberDDB(),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(
//               0, MediaQuery.of(ctx).size.height * 0.0175, 0, 0),
//           child: SizedBox(
//             width: MediaQuery.of(ctx).size.width * 0.84,
//             height: MediaQuery.of(ctx).size.height * 0.1,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: const Color.fromRGBO(255, 245, 188, 1.0),
//                 backgroundColor: Colors.lightGreen.shade900,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               onPressed: () => updateText(),
//               child: Text(
//                 'Generate Trinket',
//                 style: TextStyle(
//                     fontFamily: 'Georgia',
//                     fontSize: MediaQuery.of(ctx).size.height * .035,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(40.0),
//           child: Text(dynamicText,
//               style: TextStyle(
//                 fontFamily: 'Georgia',
//                 fontSize: MediaQuery.of(ctx).size.height * 0.03,
//               )),
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
//           child: IconButton(
//             iconSize: 36,
//             icon: const Icon(Icons.copy),
//             color: Colors.blueGrey.shade900,
//             onPressed: () {
//               Clipboard.setData(ClipboardData(text: dynamicText));
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
