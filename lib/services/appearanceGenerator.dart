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

  AppearanceItem getAppearanceObjectByRaceAndSubrace(
      String race, String subrace) {
    if (race == "Any Race" || race == null) {
      return appearanceObjList[
          Utility.getRandomIndexFromListSize(appearanceObjList.length)];
    }
    if (subrace == "Any Subrace") {
      List<AppearanceItem> appearanceItems =
          appearanceObjList.where((n) => n.race == race).toList();
      return appearanceItems[
          Utility.getRandomIndexFromListSize(appearanceItems.length)];
    }

    return appearanceObjList
        .where((n) => n.race == race && n.subrace == subrace)
        .toList()[0];
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
      return orcList[Utility.getRandomIndexFromListSize(orcList.length)];
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
      String app = makeAnAppearance(race, subrace, gender, checkboxMap);
      appearances.add(app);
    }

    return appearances;
  }

  String makeAnAppearance(String race, String subrace, String gender,
      Map<String, bool> checkboxMap) {
    Map<String, String> appMap = {
      "race": "", //a race
      "build": "", //with a build
      "skin": "", //and color skin.
      "facialhair": "", //and facial hair
      "hair": "", //with a hairstyle
      "eyes": "",
      "face": "", //He has a slender face
      "frill": "", //He has frill
      "tail": "", // and a tail
      "scar": "", //He has a scar
      "tattoo": "", //and a tattoo.
      "ailment": "", //He suffers from ailment.
      "clothing": "" //He wears clothing.
    };

    AppearanceItem appObj = getAppearanceObjectByRaceAndSubrace(race, subrace);

    race = appObj.race;
    subrace = appObj.subrace;

    //Race and Gender
    List<String> genderList = ["Female", "Male", "Non-binary"];
    if (gender == "Any Gender") {
      gender =
          genderList[Utility.getRandomIndexFromListSize(genderList.length)];
    }

    Map<String, String> pronouns = getPronouns(gender);

    if (race == "Tiefling" || race == "Human") {
      appMap["race"] = "${gender.toLowerCase()} $subrace ${race.toLowerCase()}";
    } else if (race == "Orc" && subrace == "Standard") {
      appMap["race"] = "${gender.toLowerCase()} ${race.toLowerCase()}";
    } else if (subrace == "Half-elf" || subrace == "Half-orc") {
      appMap["race"] = "${gender.toLowerCase()} ${subrace.toLowerCase()}";
    } else {
      appMap["race"] =
          "${gender.toLowerCase()} ${subrace.toLowerCase()} ${race.toLowerCase()}";
    }

    if (race != "Dragonborn" && gender != "Female") {
      String hairColor = appObj.hairColors[
          Utility.getRandomIndexFromListSize(appObj.hairColors.length)];

      appMap["facialhair"] = getFacialHair(hairColor, gender, race);
      appMap["hair"] = getHair(hairColor);
    }

    appMap["face"] = getFace();

    appMap["eyes"] = getEyes(appObj);

    appMap["frill"] = getFrill(appObj);

    appMap["tail"] = getTail(appObj);

    if (checkboxMap["Build"] == true) {
      appMap["build"] = getBuild();
    }

    if (checkboxMap["Skin Tone"] == true) {
      appMap["skin"] = getSkinTone(appObj);
    }

    if (checkboxMap["Scars"] == true) {
      appMap["scar"] = getScar();
    }

    if (checkboxMap["Tattoos"] == true) {
      appMap["tattoo"] = getTattoo(pronouns);
    }

    if (checkboxMap["Ailments"] == true) {
      appMap["ailment"] = getAilment(pronouns);
    }

    //Clothing
    if (checkboxMap["Clothing"] == true) {
      appMap["clothing"] = getScar();
    }

    StringBuffer sb = StringBuffer();
    String intro = "${Morph.indefiniteA(appMap["race"]!)} ${appMap["race"]}";
    intro =
        intro.substring(0, 1).toUpperCase() + intro.substring(1, intro.length);
    sb.write(intro);

    if (appMap["build"]!.isNotEmpty) {
      if (appMap["skin"]!.isNotEmpty) {
        sb.write(
            " with ${Morph.indefiniteA(appMap["build"]!)} ${appMap["build"]} and ${appMap["skin"]}");
      } else {
        sb.write(
            " with ${Morph.indefiniteA(appMap["build"]!)} ${appMap["build"]}.");
      }
    } else {
      if (appMap["skin"]!.isNotEmpty) {
        sb.write(
            " with ${Morph.indefiniteA(appMap["skin"]!)} ${appMap["skin"]}");
      } else {
        sb.write(".");
      }
    }
    String hairA = "";
    if (appMap["hair"]!.isNotEmpty && !appMap["hair"]!.contains("dreadlocks")) {
      hairA = "${Morph.indefiniteA(appMap["hair"]!)} ";
    }
    String facialhairA = "";
    if (appMap["facialhair"]!.isNotEmpty &&
        (!appMap["facialhair"]!.contains("stubble") &&
            !appMap["facialhair"]!.contains("no facial hair") &&
            !appMap["facialhair"]!.contains("whiskers") &&
            !appMap["facialhair"]!.contains("sideburns"))) {
      facialhairA = "${Morph.indefiniteA(appMap["facialhair"]!)} ";
    }

    if (appMap["face"]!.isNotEmpty) {
      if (appMap["hair"]!.isNotEmpty && appMap["facialhair"]!.isNotEmpty) {
        sb.write(
            " ${pronouns["Subject"]} ${pronouns["Have"]} ${Morph.indefiniteA(appMap["face"]!)} ${appMap["face"]} and $hairA${appMap["hair"]} with $facialhairA${appMap["facialhair"]}");
      } else if (appMap["hair"]!.isNotEmpty && appMap["facialhair"]!.isEmpty) {
        sb.write(
            " ${pronouns["Subject"]} ${pronouns["Have"]} ${Morph.indefiniteA(appMap["face"]!)} ${appMap["face"]} and $hairA${appMap["hair"]}");
      } else if (appMap["hair"]!.isEmpty && appMap["facialhair"]!.isNotEmpty) {
        sb.write(
            " ${pronouns["Subject"]} ${pronouns["Have"]} ${Morph.indefiniteA(appMap["face"]!)} ${appMap["face"]} with $facialhairA${appMap["facialhair"]}");
      }
    } else if (appMap["face"]!.isEmpty) {
      if (appMap["hair"]!.isNotEmpty && appMap["facialhair"]!.isNotEmpty) {
        sb.write(
            " ${pronouns["Subject"]} ${pronouns["Have"]} ${Morph.indefiniteA(appMap["hair"]!)} ${appMap["hair"]} and $facialhairA${appMap["facialhair"]}");
      } else if (appMap["hair"]!.isEmpty && appMap["facialhair"]!.isNotEmpty) {
        sb.write(
            " ${pronouns["Subject"]} ${pronouns["Have"]} $hairA${appMap["hair"]}");
      } else {
        sb.write(
            " ${pronouns["Subject"]} ${pronouns["Have"]} $facialhairA${appMap["facialhair"]}");
      }
    }

    if (appMap["eyes"]!.isNotEmpty) {
      sb.write(" and ${appMap["eyes"]}.");
    }

    if (appMap["frill"]!.isNotEmpty && appMap["tail"]!.isNotEmpty) {
      sb.write(
          "The $race has ${appMap["frill"]} and ${Morph.indefiniteA(appMap["tail"]!)} ${appMap["tail"]}");
    } else if (appMap["frill"]!.isNotEmpty && appMap["tail"]!.isEmpty) {
      sb.write("The $race has ${appMap["frill"]}.");
    } else if (appMap["frill"]!.isEmpty && appMap["tail"]!.isNotEmpty) {
      sb.write(
          "The $race has ${Morph.indefiniteA(appMap["tail"]!)} ${appMap["tail"]}.");
    }

    if (appMap["scar"]!.isNotEmpty && appMap["tattoo"]!.isNotEmpty) {
      sb.write(
          " This ${subrace.toLowerCase()} ${race.toLowerCase()} has ${Morph.indefiniteA(appMap["scar"]!)} ${appMap["scar"]} on ${pronouns["Possessive"]!.toLowerCase()} ${noun.humanoidMajorPart()} and ${Morph.indefiniteA(appMap["tattoo"]!)} ${appMap["tattoo"]}.");
    } else if (appMap["scar"]!.isNotEmpty && appMap["tattoo"]!.isEmpty) {
      sb.write(
          " This ${race.toLowerCase()} has ${Morph.indefiniteA(appMap["scar"]!)} ${appMap["scar"]} on ${pronouns["Possessive"]!.toLowerCase()} ${noun.humanoidMajorPart()}.");
    } else if (appMap["scar"]!.isEmpty && appMap["tattoo"]!.isNotEmpty) {
      sb.write(
          " This ${subrace.toLowerCase()} has ${Morph.indefiniteA(appMap["tattoo"]!)} ${appMap["tattoo"]}.");
    }

    if (appMap["ailment"]!.isNotEmpty && appMap["clothing"]!.isNotEmpty) {
      sb.write(
          " ${pronouns["Subject"]} ${pronouns["Have"]} ${appMap["ailment"]} and ${Morph.indefiniteA(appMap["clothing"]!)} ${appMap["clothing"]}.");
    } else if (appMap["ailment"]!.isNotEmpty && appMap["clothing"]!.isEmpty) {
      sb.write(
          " ${pronouns["Subject"]} ${pronouns["Have"]} ${appMap["ailment"]}.");
    } else if (appMap["ailment"]!.isEmpty && appMap["clothing"]!.isNotEmpty) {
      sb.write(
          " ${pronouns["Subject"]} ${pronouns["Have"]} ${Morph.indefiniteA(appMap["clothing"]!)} ${appMap["clothing"]}.");
    }

    return sb.toString();
  }

  String getScar() {
    return "${descriptor.scarShape()} scar";
  }

  String getSkinTone(AppearanceItem appItem) {
    String base = appItem.skinColors[
        Utility.getRandomIndexFromListSize(appItem.skinColors.length)];
    String skinColor = descriptor.variantFromBase(base);
    String skin =
        "${descriptor.skinOrHairColorDescription()} $skinColor $base skin";

    if (appItem.race == "Dragonborn") {
      int roll = DiceRoller.roll1d4();
      if (roll < 4) {
        return "${descriptor.skinOrHairColorDescription()} ${appItem.subrace.toLowerCase()} scales";
      }

      return "${descriptor.skinOrHairColorDescription()} ${appItem.subrace.toLowerCase()} and $skinColor $base scales";
    }

    int roll = DiceRoller.roll1d8();

    if (roll > 7) {
      String skinColor2 = descriptor.variantFromBase(appItem.skinColors[
          Utility.getRandomIndexFromListSize(appItem.skinColors.length)]);

      while (skinColor == skinColor2) {
        skinColor2 = descriptor.variantFromBase(appItem.skinColors[
            Utility.getRandomIndexFromListSize(appItem.skinColors.length)]);
      }
      return "${descriptor.skinOrHairColorDescription()} $base tinged with $skinColor skin";
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

    return "$build ${noun.body()}";
  }

  Map<String, String> getPronouns(String gender) {
    Map<String, String> pronounsMap = {
      "Possessive": "", //her, his, their
      "Object": "", //him, her, them
      "Subject": "", //she, he, they
      "Have": "has"
    };

    if (gender == "Female") {
      pronounsMap["Possessive"] = "Her";
      pronounsMap["Object"] = "Her";
      pronounsMap["Subject"] = "She";
    } else if (gender == "Male") {
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

  String getTattoo(Map<String, String> pronouns) {
    return "${descriptor.colorsBase()} ${noun.symbolOminous()} tattoo on ${pronouns["Possessive"]!.toLowerCase()} ${noun.humanoidMajorPart()}";
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
            "$residual $symptoms of $disease on ${pronouns["Possessive"]!.toLowerCase()} ${noun.humanoidMajorPart()}";

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
            "${noun.damageType()} damage to ${pronouns["Possessive"]!.toLowerCase()} ${noun.humanoidMajorPart()} from ${Morph.indefiniteA(monster)} $monster";

      case 5: //has a loss of a sense from a magical injury
        String creature = "";
        String battle = noun.battle();
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
            "${noun.lostSenses()} caused by ${Morph.indefiniteA(battle)} $battle with ${Morph.indefiniteA(creature)} $creature";
        break;
      case 6: //senses
        ailment =
            "${noun.symptom()} on ${pronouns["Possessive"]!.toLowerCase()} ${noun.humanoidMajorPart()} caused by ${noun.disease()}";
        break;
      default:
        ailment =
            "${noun.symptom()} on ${pronouns["Possessive"]!.toLowerCase()} ${noun.facePart()} caused by ${noun.disease()}";
        break;
    }
    return ailment;
  }

  String getHair(String hairColor) {
    String style = descriptor.hairstyles();
    String refinedColor = descriptor.colorRefined(hairColor);

    while (refinedColor == hairColor) {
      refinedColor = descriptor.colorRefined(hairColor);
    }

    if (style == "bald") {
      style = "bald head";
    } else {
      if (style.contains("dreadlocks")) {
        style = "$refinedColor $hairColor $style";
      } else {
        style = "$refinedColor $hairColor $style hairstyle";
      }
    }
    return style;
  }

  String getFacialHair(String hairColor, String gender, String race) {
    String facialHair = "$hairColor ${noun.facialHair()}";
    if (gender != "Female") {
      int roll = DiceRoller.roll1d6();
      if ((race == "Elf" || race == "Halfling") && roll < 6) {
        facialHair = "no facial hair";
      } else if (roll < 2) {
        facialHair = "no facial hair";
      }
    }

    return facialHair;
  }

  String getFrill(AppearanceItem appObj) {
    if (appObj.race == "Dragonborn") {
      String frill = appObj.frillTypes[
          Utility.getRandomIndexFromListSize(appObj.frillTypes.length)];
      String color = appObj.skinColors[
          Utility.getRandomIndexFromListSize(appObj.skinColors.length)];
      return "$color $frill";
    }
    return "";
  }

  String getTieflingTail(AppearanceItem appObj) {
    int roll = DiceRoller.roll1d6();
    String length = "";
    if (roll > 5) {
      length = "short ";
    } else if (roll > 3) {
      length = "long ";
    }

    String type =
        appObj.tails![Utility.getRandomIndexFromListSize(appObj.tails!.length)];
    String color = appObj.skinColors[
        Utility.getRandomIndexFromListSize(appObj.skinColors.length)];
    return "$length$color $type tail";
  }

  String getTail(AppearanceItem appObj) {
    if (appObj.race == "Tiefling") {
      return getTieflingTail(appObj);
    }

    return "";
  }

  String getFace() {
    return "${descriptor.faceShape()} face";
  }

  String getEyes(AppearanceItem appearanceItem) {
    List<String> eyeColors = appearanceItem.eyeColors;
    String color =
        eyeColors[Utility.getRandomIndexFromListSize(eyeColors.length)];
    return "${descriptor.eyesDescription()} $color eyes";
  }
}
