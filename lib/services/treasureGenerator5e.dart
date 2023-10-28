import 'dart:math';
import 'dart:convert';
import 'dart:io';
import 'package:generator5e/services/diceRoller.dart';

class TreasureGenerator5e{

  static void getIndividualByCR(){
  var myFile = File('data/jsondata/treasuregen.json');
  myFile.readAsString().then((contents) => {
    final parsedJson = Treasures.fromJsonjsonDecode(contents);
  }


  }


}