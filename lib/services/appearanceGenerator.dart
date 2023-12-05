import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/appearanceitem.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:generator5e/services/morphology.dart';
import 'package:generator5e/services/onomasticonNouns.dart';
import 'package:generator5e/services/utility.dart';

import 'onomasticonDescriptor.dart';
import 'onomasticonVerbs.dart';

class AppearanceGenerator {
  List _appearanceitems = [];
  List<AppearanceItem> appearanceObjList = [];
  bool _isLoaded = false;

  OnomasticonDescriptor descriptor = OnomasticonDescriptor();
  OnomasticonNoun noun = OnomasticonNoun();
  OnomasticonVerb verb = OnomasticonVerb();

  syncOno() {
    while (!descriptor.isLoaded() && !noun.isLoaded() && !verb.isLoaded()) {
      Future.delayed(const Duration(milliseconds: 100));
    }
  }

  AppearanceGenerator() {
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

  String getRandomSubraceOfRace(String race) {
    List<String> tieflingList = <String>[
      "Baalzebul",
      "Dispater",
      "Fierna",
      "Glasya",
      "Levistus",
      "Mammon",
      "Mephistopheles",
      "Zariel"
    ];
    List<String> orcList = <String>["Standard", "Half-orc"];

    if (race == "Tiefling") {
      return tieflingList[
          Utility.getRandomIndexFromListSize(tieflingList.length)];
    }

    if (race == "Orc") {
      return orcList[
      Utility.getRandomIndexFromListSize(orcList.length)];
    }

    List<AppearanceItem> objList =
        appearanceObjList.where((n) => n.race == race).toList();
    return objList[Utility.getRandomIndexFromListSize(objList.length)].subrace;
  }

  List<String> getAppearances(String race, String subrace, String gender,
      Map<String, bool> checkboxMap, String number) {
    List<String> appearances = [];
    int num = int.parse(number);
    for (int a = 0; a < num; a++) {
      String app = generateAppearance(race, subrace, gender, checkboxMap);
      appearances.add(app);
    }

    return appearances;
  }

  String generateAppearance(String race, String subrace, String gender,
      Map<String, bool> checkboxMap) {
    AppearanceItem appObj = getAppearanceObjectByRace(race);
    if (race == "Any Race") {
      race = appObj.race;
      subrace = appObj.subrace;
    }
    List<String> genderList = ["Female", "Male", "Non-binary"];
    if (gender == "Any Gender") {
      gender =
          genderList[Utility.getRandomIndexFromListSize(genderList.length)];
    }

    if (subrace == "Any Subrace") {
      subrace = getRandomSubraceOfRace(race);
    }
    Map<String, String> pronouns = getPronouns(gender);
    StringBuffer sb = StringBuffer();
    //gender subrace race
    if (race == "Tiefling" || race == "Human") {
      sb.write("A ${gender.toLowerCase()} $subrace ${race.toLowerCase()} with");
    } else if (race == "Orc" && subrace == "Standard") {
      sb.write("A ${gender.toLowerCase()} ${race.toLowerCase()} with");
    } else if (subrace == "Half-elf" || subrace == "Half-orc") {
      sb.write("A ${gender.toLowerCase()} ${subrace.toLowerCase()} with");
    } else {
      sb.write(
          "A ${gender.toLowerCase()} ${subrace.toLowerCase()} ${race.toLowerCase()} with");
    }
    String build = getBuild();

    if (checkboxMap["Build"] == true) {
      String body = noun.body();
      sb.write(" ${Morph.indefiniteA(build)} $build $body, ");
    }

    //Base - He has an oval face with a beard, wide-set brown eyes and big, broad ears.
    String face = descriptor.faceShape();
    String facialHair =
        "${descriptor.skinOrHairColorDescription()} ${noun.facialHair()}";
    if (gender != "Female") {
      int roll = DiceRoller.roll1d6();
      if ((race == "Elf" || race == "Halfling") && roll < 6) {
        facialHair = "no facial hair";
      } else if (roll < 2) {
        facialHair = "no facial hair";
      }

      if (facialHair.contains("sideburns")) {
        if (sb.toString().contains(" with")) {
          sb.write(" ${Morph.indefiniteA(face)} $face face, $facialHair and");
        } else {
          sb.write(
              " ${Morph.indefiniteA(face)} $face face with $facialHair and");
        }
      } else {
        if (facialHair == "no facial hair" && sb.toString().contains(" with")) {
          sb.write(" ${Morph.indefiniteA(face)} $face face, $facialHair and");
        } else if (sb.toString().contains(" with")) {
          sb.write(
              " ${Morph.indefiniteA(face)} $face face, ${Morph.indefiniteA(facialHair)} $facialHair and");
        } else {
          sb.write(
              " ${Morph.indefiniteA(face)} $face face with ${Morph.indefiniteA(facialHair)} $facialHair and");
        }
      }
    } else {
      sb.write(" ${Morph.indefiniteA(face)} $face face and");
    }
    String style = descriptor.hairstyles();
    if (style == "bald") {
      sb.write(" a bald head.");
    } else {
      sb.write(" ${Morph.indefiniteA(style)} $style hairstyle.");
    }

    if (checkboxMap["Skin Tone"] == true) {
      String skin = getSkinTone(appObj);
      sb.write(" ${pronouns["Subject"]} ${pronouns["Have"]} $skin and ");
    }

    if (checkboxMap["Scars"] == true) {
      String scar = getScar();

      if (checkboxMap["Skin Tone"] == true) {
        sb.write(
            " ${Morph.indefiniteA(scar)} $scar on ${pronouns["Possessive"]?.toLowerCase()} ${noun.facePart()}.");
      } else {
        sb.write(
            " ${pronouns["Subject"]} ${pronouns["Have"]} ${Morph.indefiniteA(scar)} $scar on ${pronouns["Possessive"]?.toLowerCase()} ${noun.facePart()}.");
      }
    }
    if (checkboxMap["Tattoos"] == true) {
      String tattoo = getTattoo();

      if (checkboxMap["Scars"] == false && checkboxMap["Skin Tone"] == false) {
        sb.write(
            " ${pronouns["Subject"]} ${pronouns["Have"]} ${Morph.indefiniteA(tattoo)} $tattoo on ${pronouns["Possessive"]?.toLowerCase()} ${noun.facePart()}");
      } else {
        sb.write(
            " and ${pronouns["Subject"]?.toLowerCase()} ${pronouns["Have"]?.toLowerCase()} ${Morph.indefiniteA(tattoo)} $tattoo on ${pronouns["Possessive"]?.toLowerCase()} ${noun.facePart()}");
      }
    }
    if (checkboxMap["Ailment"] == true) {
      String ailment = getAilment(pronouns);

      sb.write(" The $race ${verb.suffersFrom()} $ailment.");
    }
    if (checkboxMap["Clothing"] == true) {}

    return sb.toString();
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
      return "${descriptor.skinOrHairColorDescription()} $skinColor tinged with $skinColor2 skin";
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
      "Possessive": "", //her, his, their
      "Object": "", //him, her, them
      "Subject": "", //she, he, they
      "Have": "has"
    };

    if (gender == "female") {
      pronounsMap["Possessive"] = "Her";
      pronounsMap["Object"] = "Her";
      pronounsMap["Subject"] = "She";
    } else if (gender == "male") {
      pronounsMap["Possessive"] = "His";
      pronounsMap["Object"] = "Him";
      pronounsMap["Subject"] = "He";
    } else {
      pronounsMap["Possessive"] = "Their";
      pronounsMap["Object"] = "Their";
      pronounsMap["Subject"] = "They";
      pronounsMap["Have"] = "have";
    }

    return pronounsMap;
  }

  String getTattoo() {
    return "${descriptor.colorsBase()} ${noun.symbolOminous()} tattoo";
  }

  String getAilment(Map<String, String> pronouns) {
    String ailment = "";

    int roll = DiceRoller.roll1d6();
    switch (roll) {
      case 3: //residual symptoms of disease
        String residual = descriptor.residual();
        String symptoms = "${noun.symptom()}s";
        String disease = noun.disease();
        ailment =
            "$residual $symptoms of $disease on ${pronouns["possessive"]} ${noun.humanoidMajorPart()}";

        break;
      case 4: //magical injury
        String monster = "";
        int r = DiceRoller.roll1d12();
        switch (r) {
          case 1:
            monster = noun.aberration();
            break;
          case 2:
            monster = noun.monstrosity();
            break;
          case 3:
            monster = noun.monsterUndead();
            break;
          case 4:
            monster = noun.battle();
            break;
          case 5:
            monster = noun.dragon();
            break;
          default:
            monster = noun.soldier();
            break;
        }
        ailment =
            "${noun.damageType()} damage to ${pronouns["possessive"]} ${noun.humanoidMajorPart()} from ${Morph.indefiniteA(monster)} $monster";

      case 5: //has a loss of a sense from a magical injury
        String creature = "";
        int d = DiceRoller.roll1d12();
        switch (d) {
          case 1:
            creature = noun.aberration();
            break;
          case 2:
            creature = noun.monstrosity();
            break;
          case 3:
            creature = noun.monsterUndead();
            break;
          case 4:
            creature = noun.battle();
            break;
          case 5:
            creature = noun.dragon();
            break;
          default:
            creature = noun.soldier();
            break;
        }

        ailment =
            "${noun.lostSenses()} caused by ${Morph.indefiniteA(creature)} $creature";
        break;
      case 6: //senses
        ailment =
            "${noun.symptom()} on ${pronouns["possessive"]} ${noun.humanoidMajorPart()} caused by ${noun.disease()}";
        break;
      default:
        ailment =
            "${noun.symptom()} on ${pronouns["possessive"]} ${noun.facePart()} caused by ${noun.disease()}";
        break;
    }
    return ailment;
  }
}
