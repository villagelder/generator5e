import 'dart:math';
import 'dart:convert';
import 'dart:io';
import 'package:generator5e/services/diceRoller.dart';

class TreasureGenerator5e {
  static Future<List<Map>> readJsonFile(String filePath) async {
    String filePath = "generator5e/data/jsondata/treasuregen.json";
    var input = await File(filePath).readAsString();
    var map = jsonDecode(input);
    return map['users'];
  }
}
