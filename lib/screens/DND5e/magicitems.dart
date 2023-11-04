import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator5e/services/magicItemGenerator.dart';

class MagicItemsPage extends MaterialPageRoute<Null> {
  MagicItemsPage()
      : super(builder: (BuildContext ctx) {
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
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 0),
                    child: SizedBox(
                      height: MediaQuery.of(ctx).size.height * 0.06,
                      child: Center(
                        child: Text(
                          '5e Magic Items',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: MediaQuery.of(ctx).size.height * 0.044,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(34, 56, 69, 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(ctx).size.width * 0.84,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                      child: Text(
                        'Select your magic item Rarity, Type, and Number, then push \'Generate Magic Item\' to '
                        'generate new magic items.',
                        style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: MediaQuery.of(ctx).size.height * 0.022,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const TextChanger(),
                ],
              ),
            ),
          );
        });
}

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

class RarityDDB extends StatefulWidget {
  const RarityDDB({super.key});

  @override
  State<RarityDDB> createState() => _RarityDDBState();
}

const List<String> rarityList = <String>[
  'Any Rarity',
  'Common',
  'Uncommon',
  'Rare',
  'Very Rare',
  'Legendary'
];
const List<String> itemTypeList = <String>[
  'All Items',
  'Armor',
  'Potion',
  'Ring',
  'Rod',
  'Scroll',
  'Staff',
  'Wand',
  'Weapon',
  'Wondrous Item'
];
const List<String> numberList = <String>['1', '2', '3', '5', '8'];

class _RarityDDBState extends State<RarityDDB> {
  static String rarityValue = rarityList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: const Color.fromRGBO(38, 50, 56, 1.0),
            style: BorderStyle.solid,
            width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.47,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: rarityValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
              color: const Color.fromRGBO(38, 50, 56, 1.0),
              fontFamily: 'Georgia',
              fontSize: MediaQuery.of(context).size.height * 0.025,
              fontWeight: FontWeight.w500,
            ),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                rarityValue = value!;
              });
            },
            items: rarityList.map<DropdownMenuItem<String>>((String value) {
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
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.075,
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
                fontSize: MediaQuery.of(context).size.height * 0.025,
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
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, MediaQuery.of(context).size.height * 0.0175, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: Colors.brown.shade800,
              style: BorderStyle.solid,
              width: 2.0),
        ),
        width: MediaQuery.of(context).size.width * 0.84,
        height: MediaQuery.of(context).size.height * 0.075,
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
                  fontSize: MediaQuery.of(context).size.height * 0.025,
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
      ),
    );
  }
}

class TextChanger extends StatefulWidget {
  const TextChanger({super.key});

  @override
  State<TextChanger> createState() => _TextChangerState();
}

class _TextChangerState extends State<TextChanger> {
  // Declare the variable
  String dynamicText = 'Roll for magic item.';
  MagicItemGenerator5e mig = MagicItemGenerator5e();

  updateText() {
    setState(() {
      dynamicText = 'changed';
      // dynamicText = trGen
      //     .generate(_RarityDDBState.crValue, _TreasureTypeDDBState.ttValue)
      //     .toString();
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 42, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RarityDDB(),
              NumberDDB(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              ItemTypeDDB(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(ctx).size.height * 0.0175, 0, 0),
          child: SizedBox(
            width: MediaQuery.of(ctx).size.width * 0.84,
            height: MediaQuery.of(ctx).size.height * 0.1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(255, 245, 188, 1.0),
                backgroundColor: Colors.lightGreen.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () => updateText(),
              child: Text(
                'Generate Magic Item',
                style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: MediaQuery.of(ctx).size.height * .035,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(dynamicText,
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(ctx).size.height * 0.03,
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
          child: IconButton(
            iconSize: 36,
            icon: const Icon(Icons.copy),
            color: Colors.blueGrey.shade900,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: dynamicText));
            },
          ),
        ),
      ],
    );
  }
}
