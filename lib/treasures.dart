import 'package:flutter/material.dart';

class TreasuresPage extends MaterialPageRoute<Null> {
  TreasuresPage()
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
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                    child: SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          '5e Treasure Generator',
                          style: TextStyle(
                            fontSize: 32,
                            color: Color.fromRGBO(34, 56, 69, 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChallengeRatingDDB(),
                        TreasureTypeDDB(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                    child: SizedBox(
                      width: MediaQuery.of(ctx).size.width * 0.84,
                      height: MediaQuery.of(ctx).size.height * 0.1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.amber.shade200,
                          backgroundColor: Colors.brown.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Generate Treasure',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Text(
                            '32000 gp, 30000 pp, a dragon horn medallion engraved '
                            'with an ancient coat of arms (2500 gp), a dragon horn '
                            'medallion engraved with arcane runes (2500 gp), a gilded '
                            'wooden medallion inlaid with a meandros of orichalcum (2500 gp), '
                            'a gilded wooden shield brooch engraved with floral vines (2500 gp), '
                            'a gold bracer set with a rosette of opal (2500 gp), a silk brocade '
                            'tabard trimmed with ermine (2500 gp), a silk carpet embroidered with '
                            'gold (2500 gp), an amber puzzle box engraved with dwarven axeheads (2500 gp), '
                            'an onyx plate engraved with a labyrinth (2500 gp), Spell Scroll (Maze) '
                            '(very rare, dmg 200), Spell Scroll (Power Word Stun) (very rare, dmg 200), '
                            'Spell Scroll (Telepathy) (very rare, dmg 200), Spell Scroll (Foresight) '
                            '(legendary, dmg 200)',
                            style: TextStyle(fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                        child: Icon(
                          Icons.copy,
                          color: Colors.brown.shade800,
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
}

class ChallengeRatingDDB extends StatefulWidget {
  const ChallengeRatingDDB({super.key});

  @override
  State<ChallengeRatingDDB> createState() => _ChallengeRatingDDBState();
}

class TreasureTypeDDB extends StatefulWidget {
  const TreasureTypeDDB({super.key});

  @override
  State<TreasureTypeDDB> createState() => _TreasureTypeDDBState();
}

const List<String> crList = <String>['CR 0-4', 'CR 5-10', 'CR 11-16', 'CR 17+'];
const List<String> trList = <String>['Individual', 'Hoard'];

class _TreasureTypeDDBState extends State<TreasureTypeDDB> {
  String dropdownValue = trList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: const TextStyle(
                color: Colors.brown, fontSize: 20, fontWeight: FontWeight.bold),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: trList.map<DropdownMenuItem<String>>((String value) {
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

class _ChallengeRatingDDBState extends State<ChallengeRatingDDB> {
  String dropdownValue = crList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.brown.shade800, style: BorderStyle.solid, width: 2.0),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            elevation: 16,
            style: const TextStyle(
                color: Colors.brown, fontSize: 20, fontWeight: FontWeight.bold),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: crList.map<DropdownMenuItem<String>>((String value) {
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
