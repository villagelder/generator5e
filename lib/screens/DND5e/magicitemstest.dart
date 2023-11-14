import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator5e/services/magicItemGenerator.dart';

class MagicItemsPageTest extends MaterialPageRoute<void> {
  MagicItemsPageTest()
      : super(builder: (BuildContext ctx) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
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
            const ListViewer(),
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

class ItemSubTypeDDB extends StatefulWidget {
  const ItemSubTypeDDB({super.key});

  @override
  State<ItemSubTypeDDB> createState() => _ItemSubTypeDDBState();
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
  'Legendary',
  'Artifact'
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
const List<String> numberList = <String>['1', '2', '3', '5', '8', '13'];

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
      width: MediaQuery.of(context).size.width * 0.45,
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
              fontSize: MediaQuery.of(context).size.height * 0.023,
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
      width: MediaQuery.of(context).size.width * 0.35,
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
                fontSize: MediaQuery.of(context).size.height * 0.023,
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
  static String itemValue = itemTypeList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.845,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: itemValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
                color: const Color.fromRGBO(38, 50, 56, 1.0),
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.023,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                itemValue = value!;
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

class _ItemSubTypeDDBState extends State<ItemSubTypeDDB> {
  static String itemValue = itemTypeList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: itemValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: TextStyle(
                color: const Color.fromRGBO(38, 50, 56, 1.0),
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.023,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                itemValue = value!;
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


class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  // Declare the variable
  List<String> magicItemsList = ['Magic Items'];
  MagicItemGenerator5e mig5e = MagicItemGenerator5e();

  updateList() {
    magicItemsList = mig5e.generateMagicItemsArray(_RarityDDBState.rarityValue,
        _ItemTypeDDBState.itemValue, _NumberDDBState.numberValue);
    setState(() {
      magicItemsList;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: SizedBox(
            width: MediaQuery.of(ctx).size.width * 0.845,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RarityDDB(),
                NumberDDB(),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              onPressed: () => updateList(),
              child: Text(
                'Generate Magic Items',
                style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: MediaQuery.of(ctx).size.height * .035,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(ctx).size.height * 0.0175, 0, 0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(ctx).size.width * 0.86,
                height: MediaQuery.of(ctx).size.height * 0.42,
                child: Card(
                  elevation: 0,
                  color: Colors.blueGrey.shade100,
                  child: ListView.builder(
                    key: ObjectKey(magicItemsList[0]),
                    itemCount: magicItemsList.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(ctx).size.height * 0.01, 0, 0),
                        child: ListTile(
                          title: Text(magicItemsList[index]),
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
    dynamicText = mig.generateRandomMagicItems(_RarityDDBState.rarityValue,
        _ItemTypeDDBState.itemValue, int.parse(_NumberDDBState.numberValue));
    setState(() {
      dynamicText;

    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: SizedBox(
            width: MediaQuery.of(ctx).size.width * 0.845,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RarityDDB(),
                NumberDDB(),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                'Generate Magic Items',
                style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: MediaQuery.of(ctx).size.height * .035,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
          child: SizedBox(
            width: MediaQuery.of(ctx).size.width * 0.7,
            child: Text(dynamicText,
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: MediaQuery.of(ctx).size.height * 0.03,
                )),
          ),
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
