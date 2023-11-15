import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:generator5e/services/onomasticonDescriptor.dart';
import 'package:generator5e/services/onomasticonNouns.dart';

import 'morphology.dart';
import 'onomasticonVerbs.dart';

class PersonalityGenerator {

  List _personalityItems = [];
  List _backgroundItems =[];
  List<Personality> personalityObjList = [];



  Future<void> readJsonTreasureTable() async {
    final String response =
    await rootBundle.loadString('assets/jsondata/personalities.json');
    final data = await json.decode(response);
    _personalityItems = data["treasures"] as List;
  }

  getTreasuresObjectList() {
    personalityObjList =
        _personalityItems.map((tJson) => Personality.fromJson(tJson)).toList();
  }

}
