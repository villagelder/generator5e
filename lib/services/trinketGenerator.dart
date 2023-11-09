import 'package:generator5e/services/onomasticonDescriptor.dart';
import 'package:generator5e/services/onomasticonNouns.dart';

import 'onomasticonVerbs.dart';

class TrinketGenerator {
  OnomasticonDescriptor descriptor = OnomasticonDescriptor();
  OnomasticonNoun noun = OnomasticonNoun();
  OnomasticonVerb verb = OnomasticonVerb();

  syncOno() {
    while (!descriptor.isLoaded() && !noun.isLoaded() && !verb.isLoaded()) {
      Future.delayed(const Duration(milliseconds: 100));
    }
  }

  String generateTrinkets(String type, String number) {
    syncOno();
    type = type.toLowerCase();
    List<String> trinketList = [];
    int n = int.parse(number);

    for (int i = 0; i < n; i++) {
      switch (type) {
        case "martial":
          trinketList.add(getTrinketMartial());
          break;
        case "kindred":
          trinketList.add(getTrinketKindred());
          break;
        case "macabre":
          trinketList.add(getTrinketMacabre());
          break;
        case "mystical":
          trinketList.add(getTrinketMystical());
          break;
        case "nature":
          trinketList.add(getTrinketNature());
          break;
        case "romantic":
          trinketList.add(getTrinketRomantic());
          break;
        case "scholarly":
          trinketList.add(getTrinketScholarly());
          break;
        case "traveler":
          trinketList.add(getTrinketTraveler());
          break;
        case "religious":
          trinketList.add(getTrinketReligious());
          break;
        default:
          trinketList.add(getTrinketAll());
      }
    }

    return trinketList.toString();
  }

  String getTrinketMartial() {
    String trinket = "";
    return trinket;
  }

  String getTrinketKindred() {
    String trinket = "";
    return trinket;
  }

  String getTrinketMacabre() {
    String trinket = "";

    //     return "a ${descriptor.macabre()} ${noun.humanoid()} ${noun.humanoidPart()}";
    //     String nightmarish = descriptor.macabre();
//     String dream = noun.dream();
//     return "a small ${noun.idol()} ${verb.depict()}ing ${Morph.indefiniteA(nightmarish)} $nightmarish ${noun.monsterTerror()} that gives you ${descriptor.scary()} ${Morph.addAnS(dream)}";
//     return "a ${noun.textile()} ${noun.jewelry()} from which ${verb.dangle()} ${DiceRoller.roll1d4() + 1} ${descriptor.macabre()} ${noun.humanoid()} ${Morph.addAnS(noun.humanoidPart())}";

    return trinket;
  }

  String getTrinketMystical() {
    String trinket = "";

    //     return "a ${noun.rockPiece()} of ${noun.mineral()} that faintly ${verb.ping()}s in ${noun.darkPlaces()}";
    //     String smpMetal = noun.metalAll();
    //     return "${Morph.indefiniteA(smpMetal)} $smpMetal ${noun.jewelry()} that never ${Morph.addAnS(verb.corrode())}";
    return trinket;
  }

  String getTrinketNature() {
    String trinket = "";
    return trinket;
  }

  String getTrinketRomantic() {
    String trinket = "";
    return trinket;
  }

  String getTrinketScholarly() {
    String trinket = "";
    //     return "a ${DiceRoller.roll1d4() + 1}-ounce ${noun.rockPiece()} made from an unknown mineral";
    return trinket;
  }

  String getTrinketTraveler() {
    String trinket = "";

    //     String foreign = descriptor.foreign();
    //     String prMetal = noun.metalPrecious();
    //     return "${Morph.indefiniteA(prMetal)} $prMetal ${noun.coin()} ${Morph.pastTense(verb.mint())} in ${Morph.indefiniteA(foreign)} $foreign ${noun.kingdom()}";
    //     String diary = noun.journal();
    //     return "${Morph.indefiniteA(diary)} $diary written in a ${noun.language()} you don't ${verb.understand()}";
    //     String old = descriptor.ancient();
    //     return "${Morph.indefiniteA(old)} $old ${noun.game()} piece ${Morph.pastTense(verb.forge())} from ${noun.mineral()}";
    //     String lot = noun.assortment();
//     String symb = noun.symbolOminous();
//     return "${Morph.indefiniteA(lot)} $lot of ${noun.mineral()} dice, each with ${Morph.indefiniteA(symb)} $symb ${noun.symbol()} on their highest side";
//     String parcel = noun.parcel();
//     return "the ${noun.document()} to ${Morph.indefiniteA(parcel)} $parcel of land in a ${noun.kingdom()} unknown to you";
    return trinket;
  }

  String getTrinketReligious() {
    String trinket = "";
    return trinket;
  }

  String getTrinketAll() {
    String trinket = "";
    return trinket;
  }
}
