import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/appearanceitem.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:generator5e/services/morphology.dart';
import 'package:generator5e/services/onomasticonNouns.dart';
import 'package:generator5e/services/utility.dart';

import 'onomasticonDescriptor.dart';
import 'onomasticonVerbs.dart';

class AbilityScoreGenerator {
  List _appearanceitems = [];
  List<AppearanceItem> appearanceObjList = [];
  bool _isLoaded = false;

  OnomasticonDescriptor descriptor = OnomasticonDescriptor();
  OnomasticonNoun noun = OnomasticonNoun();
  OnomasticonVerb verb = OnomasticonVerb();

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
    // "Build": false,
    // "Skin Tone": false,
    // "Scars": false,
    // "Tattoos": false,
    // "Ailments": false,
    // "Clothing": false,
    AppearanceItem appObj = getAppearanceObjectByRace(race);

    Map<String, String> pronouns = getPronouns(gender);
    StringBuffer sb = StringBuffer();
    //Base - A male mountain dwarf with frosted brown hair in a feathered hairstyle.
    sb.write(
        "A $gender $subrace $race in a ${descriptor.hairstyles()} hairstyle.");

    //Base - He has an oval face with a beard, wide-set brown eyes and big, broad ears.
    String face = descriptor.faceShape();
    String facialHair =
        "${descriptor.skinOrHairColorDescription()} ${noun.facialHair()}";
    if (gender != "Female") {
      int roll = DiceRoller.roll1d6();
      if ((race == "Elf" || race == "Halfling") && roll < 6) {
        facialHair = "no facial hair";
      } else if (roll < 4) {
        facialHair = "no facial hair";
      }
      sb.write(
          " ${pronouns["subject"]} has ${Morph.indefiniteA(
              face)} $face with ${Morph.indefiniteA(face)} $facialHair");
    }

    if (checkboxMap["Build"] == true) {
      String build = getBuild();
      sb.write(" The $race has ${Morph.indefiniteA(build)} $build");
    }

    if (checkboxMap["Skin Tone"] == true) {
      String skin = getSkinTone(appObj);
      sb.write(" with $skin");
    }
    if (checkboxMap["Scars"] == true) {
      String scar = getScar();
      sb.write(
          " and ${Morph.indefiniteA(
              scar)} $scar on ${pronouns["possessive"]} ${noun.facePart()}");
    }
    if (checkboxMap["Tattoos"] == true) {
      String tattoo = getTattoo();
      sb.write("${pronouns["Subject"]} has ${Morph.indefiniteA(
          tattoo)} $tattoo on ${pronouns["Possessive"]} ${noun.facePart()}");
          }
    if (checkboxMap["Ailment"] == true){
      String ailment = getAilment();

      sb.write(ailment);
      }
      if (checkboxMap["Clothing"] == true) {}
      //Build, Scar - This dwarf has a robust build with a jagged scar on his forehead.
      //Tattoo - He has a celtic knot tattoo on his forearm.
      //Ailment - He walks with a limp from a battle wound long ago.
      //Clothing - He wears a white linen shirt and brown pants.

      //gender race, subrace
//hair, eyes, ears
      //facial hair

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

  String getScar() {
    return "${descriptor.scarShape()} scar";
  }

  String getSkinTone(AppearanceItem appItem) {
    String skinColor = descriptor.variantFromBase(appItem.skinColors[
    Utility.getRandomIndexFromListSize(appItem.skinColors.length)]);
    String skin = "${descriptor.skinOrHairColorDescription()} $skinColor skin";

    int roll = DiceRoller.roll1d6();

    if (roll > 4) {
      String skinColor2 = descriptor.variantFromBase(appItem.skinColors[
      Utility.getRandomIndexFromListSize(appItem.skinColors.length)]);

      while (skinColor == skinColor2) {
        skinColor2 = descriptor.variantFromBase(appItem.skinColors[
        Utility.getRandomIndexFromListSize(appItem.skinColors.length)]);
      }
      return "${descriptor
          .skinOrHairColorDescription()} $skinColor tinged with $skinColor2 skin";
    }
    return skin;
  }

  String getBuild() {
    String build = "";
    int r = DiceRoller.roll1d12();

    switch (r) {
      case 2:
        build = descriptor.hefty();
        break;
      case 3:
        build = descriptor.thin();
        break;
      case 4:
        build = descriptor.average();
        break;
      case 5:
        build = descriptor.agile();
        break;
      case 6:
        build = descriptor.muscular();
        break;
      case 7:
        build = "${descriptor.agile()} and ${descriptor.attractive()}";
        break;
      case 8:
        build = "${descriptor.muscular()} and ${descriptor.attractive()}";
        break;
      case 9:
        build = "${descriptor.thin()} and ${descriptor.weak()}";
        break;
      case 10:
        build = "${descriptor.hefty()} but ${descriptor.muscular()}";
        break;
      case 11:
        build = "${descriptor.thin()} but ${descriptor.agile()}";
        break;
      case 12:
        build = "${descriptor.muscular()} and ${descriptor.agile()}";
        break;
      default:
        build = descriptor.weak();
        break;
    }

    return build;
  }

  Map<String, String> getPronouns(String gender) {
    gender = gender.toLowerCase();

    Map<String, String> pronounsMap = {
      "Possessive": "",
      "Object": "",
      "Subject": ""
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

  String getTattoo() {
    return "${descriptor.colorsBase()} ${noun.symbolOminous()} tattoo";
  }

  String getAilment() {
    String ailment = "";
    return ailment;
  }
}
