import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/magicitem.dart';
import 'package:generator5e/services/utility.dart';

import '../models/nameitem.dart';
import '../models/spell.dart';

class NameGenerator5e {
  List _nameitems = [];
  List<Name> namesObjList = [];
  bool _isLoaded = false;

  MagicItemGenerator5e() {
    readJsonNames().then((_) {
      _isLoaded = true;
      getNamesObjectList();
    });
  }

  sync() {
    while (!_isLoaded) {
      Future.delayed(const Duration(milliseconds: 100));
    }
  }

  Future<void> readJsonNames() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/names.json');
    final data = await json.decode(response);
    _nameitems = data["names"] as List;
  }

  getNamesObjectList() {
    namesObjList = _nameitems.map((mJson) => Name.fromJson(mJson)).toList();
  }

  List<Name> getAllNameItems() {
    return namesObjList;
  }

  Name getNameObjectByRace(String race) {
    race = race.toLowerCase();
    return namesObjList.where((n) => n.race == race).toList()[0];
  }

  String generateName(String race, String gender) {
    Name nameObj = getNameObjectByRace(race);
    List<String> firstNamesList = [];
    List<String>? lastNamesList = nameObj.lastNames;
    List<String>? nicknamesList = nameObj.nicknames;

    if (gender == "Male") {
      firstNamesList = nameObj.maleFirstNames;
    } else if (gender == "Female") {
      firstNamesList = nameObj.femaleFirstNames;
    } else {
      firstNamesList = nameObj.maleFirstNames;
      firstNamesList.addAll(nameObj.femaleFirstNames);
    }

    String firstName = firstNamesList[
        Utility.getRandomIndexFromListSize(firstNamesList.length)];
    String lastName =
        lastNamesList[Utility.getRandomIndexFromListSize(lastNamesList.length)];

    if (nicknamesList!.isNotEmpty) {
      String nickname = nicknamesList[
          Utility.getRandomIndexFromListSize(nicknamesList.length)];

      return "$firstName $lastName $nickname";
    }

    return "$firstName $lastName";
  }

  List<String> generateNames(String race, String gender, int num) {
    List<String> namesList = [];

    for (int i = 0; i < num; i++) {
      namesList.add(generateName(race, gender));
    }
    return namesList;
  }

  List<String> getRacesWithNames() {
    List<String> races = [];

    for (Name name in getNamesObjectList()){

      if (!races.contains(name.race)) {
        races.add(name.race);
      }
    }
    return races;
  }
}
