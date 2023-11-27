import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/appearanceitem.dart';
import 'package:generator5e/services/utility.dart';

class AbilityScoreGenerator {
  List _appearanceitems = [];
  List<AppearanceItem> appearanceObjList = [];
  bool _isLoaded = false;

  AbilityScoreGenerator() {
    init();
  }

  Future<void> init() async {
    await readJsonAppearances();
    getAppearanceObjectList();
  }

  Future<void> readJsonAppearances() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/appearance.json');
    final data = await json.decode(response);
    _appearanceitems = data["appearance"] as List;
  }

  getAppearanceObjectList() {
    appearanceObjList = _appearanceitems
        .map((aJson) => AppearanceItem.fromJson(aJson))
        .toList();
  }

  List<AppearanceItem> getAllAppearancesItems() {
    return appearanceObjList;
  }

  AppearanceItem getAppearanceObjectByRace(String race) {
    if (race == "Any Race" || race == null) {
      return appearanceObjList[
          Utility.getRandomIndexFromListSize(appearanceObjList.length)];
    }
    return appearanceObjList.where((n) => n.race == race).toList()[0];
  }

  String generateAppearance(String race, String subrace, String gender, Map<String, bool> checkboxMap) {
    AppearanceItem appObj = getAppearanceObjectByRace(race);

    StringBuffer sb = StringBuffer();
    sb.write("$gender $subrace $race");




    //race, subrace appearance


    //gender


    //checkbox Map
    //Build
    //Facial Hair
    //Markings
    //Tattoos
    //Ailments
    //Accessories




    String appearance = "";
    return appearance;
  }
}
