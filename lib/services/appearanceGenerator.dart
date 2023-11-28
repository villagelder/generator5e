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

  String generateAppearance(String race, String subrace, String gender,
      Map<String, bool> checkboxMap) {
    AppearanceItem appObj = getAppearanceObjectByRace(race);

    StringBuffer sb = StringBuffer();
    sb.write("A $gender $subrace $race");

    //gender race, subrace

    //gender, facial hair
    //hair, eyes, ears

    //A gender subrace race (optional skin tone) with eyes and hair. Optional face and ears.
    //Pronoun has a build
    //with a scar
    //with a tattoo
    //Pronoun appears to have an ailment
    //Pronoun is wearing clothing

    //checkbox Map
    //Build
    //Skin tone
    //Scars
    //Tattoos
    //Ailments
    //Clothing

    String appearance = "";
    return appearance;
  }

  String getSkinToneByRaceSubrace(String race, String subrace){
    String skin = "";



    return skin;
  }



  Map<String, String> getPronouns(String gender) {
    gender = gender.toLowerCase();

    Map<String, String> pronounsMap = {
      "Possessive": "",
      "Object" : "",
      "Subject" : ""
    };

    if (gender == "female") {
      pronounsMap["Possessive"] = "Hers";
      pronounsMap["Objective"] = "Her";
      pronounsMap["Subject"] = "She";
    } else if (gender == "male") {
      pronounsMap["Possessive"] = "His";
      pronounsMap["Objective"] = "Him";
      pronounsMap["Subject"] = "He";
    } else {
      pronounsMap["Possessive"] = "Theirs";
      pronounsMap["Objective"] = "Their";
      pronounsMap["Subject"] = "They";
    }

    return pronounsMap;
  }
}
