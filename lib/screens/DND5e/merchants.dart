import 'package:flutter/material.dart';
import 'package:generator5e/services/magicItemGenerator.dart';

class MerchantsPage extends MaterialPageRoute<void> {
  MerchantsPage()
      : super(builder: (BuildContext ctx) {
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

class NumberDDB extends StatefulWidget {
  final Function(String) onNumberChanged;

  NumberDDB({super.key, required this.onNumberChanged});

  @override
  State<NumberDDB> createState() => _NumberDDBState();
}

class ItemTypeDDB extends StatefulWidget {
  final Function(String) onItemTypeChanged;

  ItemTypeDDB({super.key, required this.onItemTypeChanged});

  @override
  State<ItemTypeDDB> createState() => _ItemTypeDDBState();
}

class RarityDDB extends StatefulWidget {
  final Function(String) onRarityChanged;

  RarityDDB({super.key, required this.onRarityChanged});

  @override
  State<RarityDDB> createState() => _RarityDDBState();
}

const List<String> merchantList = <String>[
  'Any Merchant Type',
  'Apothecary',
  'Armorer',
  'Bookseller',
  'Fletcher',
  'General Store',
  'Herbalist',
  'Innkeeper',
  'Jeweler',
  'Spice Trader',
  'Spirits Trader',
  'Tanner',
  'Weaponsmith'
];

const List<String> sizeList = <String>[
  'Any Size',
  'Traveling Merchant',
  'Village',
  'Town',
  'Small City',
  'Large City'
];
const List<String> numberList = <String>['1', '2', '3', '5', '8', '13'];

class _RarityDDBState extends State<RarityDDB> {
  String rarityValue = merchantList.first;

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
      width: MediaQuery.of(context).size.width * 0.225,
      // height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            dropdownColor: Colors.brown.shade400,
            value: rarityValue,
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
              if (value != null) {
                setState(() {
                  rarityValue = value;
                });
                widget.onRarityChanged(value);
              }
            },
            items: merchantList.map<DropdownMenuItem<String>>((String value) {
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
        color: Colors.brown.shade400,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade900, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.1,
      // height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            dropdownColor: Colors.brown.shade400,
            value: numberValue,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.brown.shade900,
            ),
            elevation: 16,
            style: TextStyle(
                color: Colors.amber.shade100,
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.brown.shade900,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              if (value != null) {
                setState(() {
                  numberValue = value;
                });
                widget.onNumberChanged(value);
              }
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
  String itemValue = sizeList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown.shade400,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade900, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.34,
      // height: MediaQuery.of(context).size.height * 0.075,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            dropdownColor: Colors.brown.shade400,
            value: itemValue,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.brown.shade900,
            ),
            elevation: 16,
            style: TextStyle(
                color: Colors.amber.shade100,
                fontFamily: 'Georgia',
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              if (value != null) {
                setState(() {
                  itemValue = value!;
                });
                widget.onItemTypeChanged(value);
              }
            },
            items: sizeList.map<DropdownMenuItem<String>>((String value) {
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
  String selectedMerchantType = merchantList.first;
  String selectedSize = sizeList.first;
  String selectedNumber = numberList.first;

  // Declare the variable
  List<String> magicItemsList = ['Magic Items'];
  MagicItemGenerator5e mig5e = MagicItemGenerator5e();

  void onMerchantChanged(String newValue) {
    setState(() {
      selectedMerchantType = newValue;
    });
    updateList();
  }

  void onSizeChanged(String newValue) {
    setState(() {
      selectedSize = newValue;
    });
    updateList();
  }

  void onNumberChanged(String newValue) {
    setState(() {
      selectedNumber = newValue;
    });
    updateList();
  }

  void updateList() {
    magicItemsList = mig5e.generateMagicItemsArray(
        selectedMerchantType, selectedSize, selectedNumber);
    setState(() {
      magicItemsList;
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
                              '5e Magic Item Generator',
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
                          width: MediaQuery.of(ctx).size.width * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RarityDDB(onRarityChanged: onMerchantChanged),
                              NumberDDB(onNumberChanged: onNumberChanged),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(ctx).size.height * 0.04, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ItemTypeDDB(
                              onItemTypeChanged: onSizeChanged,
                            ),
                          ],
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
                              'Generate Magic Items',
                              style: TextStyle(
                                  fontFamily: 'Georgia',
                                  fontSize:
                                      MediaQuery.of(ctx).size.height * .044,
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
                                key: ObjectKey(magicItemsList[0]),
                                itemCount: magicItemsList.length,
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
                                      dense: true,
                                      tileColor: Colors.orange.shade100,
                                      title: Text(
                                        magicItemsList[index],
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

class MerchantTable extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'item': 'Potion', 'qty': 10, 'cost': '50 gold'},
    {'item': 'Sword', 'qty': 5, 'cost': '100 gold'},
    {'item': 'Shield', 'qty': 3, 'cost': '150 gold'},
    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            '5e Merchant Generator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(items[index]['item']),
                    trailing: Text(
                        '${items[index]['qty']} x ${items[index]['cost']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
