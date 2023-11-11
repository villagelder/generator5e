import 'package:flutter/material.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:generator5e/services/onomasticonDescriptor.dart';
import 'package:generator5e/services/onomasticonNouns.dart';

import 'morphology.dart';
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
        case "sentimental":
          trinketList.add(getTrinketSentimental());
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

    var sb = StringBuffer();
    for (int i = 0; i < trinketList.length; i++) {
      if (i != trinketList.length - 1) {
        sb.write('• ${trinketList[i]}\n');
      } else {
        sb.write('• ${trinketList[i]}');
      }
    }

    return sb.toString();
  }

  String getTrinketMartial() {
    String trinket = "";
    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1:
        return "a pair of old ${noun.thingsInPairs()}";
      case 2:
        return "";
      case 3:
        return "a scrap of cloth from an old banner";
      case 4:
        return "a rank insignia from a ${descriptor.lostInBattle()} ${noun.soldier()}";
      case 5:
        return "two toy ${noun.soldier()}s, one with a missing ${noun.humanoidPart()}";
      case 6:
        return "a hilt from a broken ${noun.weaponMelee()}";
      case 7:
        return "a caltrop made from ${noun.mineral()}";
      case 8:
        String ornate = descriptor.ornate();
        String a = Morph.indefiniteA(ornate);
        return "$a $ornate scabbard that fits no blade you have found so far";
      case 9:
        String ancient = descriptor.ancient();
        String a = Morph.indefiniteA(ancient);
        String race = noun.humanoid();
        return "$a $ancient ${noun.ammunition()} of ${Morph.heritage(race)} design";
      case 10:
        String color = descriptor.colorsBase();
        String a = Morph.indefiniteA(color);
        return "$a $color ${noun.pirate()} flag adorned with a ${noun.symbolOminous()}";
      case 11:
        String hero = noun.heroesAndVillains();
        String an = Morph.indefiniteA(hero);
        String material = descriptor.material();
        String a = Morph.indefiniteA(material);
        return "$a $material ${noun.container()} containing the ${noun.remains()} of $an $hero";
      case 12:
        return "a shard from a broken ${noun.weaponMelee()}";
      case 13:
        String ornate = descriptor.ornate();
        String a = Morph.indefiniteA(ornate);
        return "$a $ornate scabbard that fits a ${noun.weaponMelee()}";
      case 14:
        String weapon = noun.weaponMelee();
        String monster = noun.monsterTerror();
        String an = Morph.indefiniteA(weapon);
        String a = Morph.indefiniteA(monster);
        return "$an $weapon made from the bone of $a $monster";
      case 15:
        String unknown = descriptor.foreign();
        String a = Morph.indefiniteA(unknown);
        return "an honorary medal from a hero of $a $unknown ${noun.kingdom()}";
      case 16:
        return "a piece of a ${noun.armorPiece()} from your ${noun.familyMember()}";
      case 17:
        return "a watch ${noun.journal()} from a previous military battle";
      case 18:
        String inscribed = Morph.pastTense(verb.inscribe());
        return "a ${noun.armorPiece()} $inscribed with the ${noun.symbol()} of a ${descriptor.colorsBase()} ${noun.symbolOminous()}";
      case 19:
        return "your ${descriptor.lostInBattle()} ${noun.familyMember()}'s medal of bravery on the battlefield";
      case 20:
        String humanoid = noun.humanoid();
        String humanoidPart = noun.humanoidPart();
        String a = Morph.indefiniteA(humanoid);
        String b = Morph.indefiniteA(humanoidPart);
        String foreign = descriptor.foreign();
        String an = Morph.indefiniteA(foreign);
        return "$b $humanoidPart of $a $humanoid that killed your ${noun.familyMember()} in $an $foreign ${noun.kingdom()} ";
    }
    return trinket;
  }

  String getTrinketSentimental() {
    String trinket = "";
    int roll = DiceRoller.roll1d10();
    switch (roll) {
      case 1:
        return "a tiny ${noun.humanoid()}-crafted music box that plays a song you dimly remember from your childhood";
      case 2:
        String tool = noun.toolSmall();
        String a = Morph.indefiniteA(tool);
        return "$a $tool that belonged to your ${noun.familyMember()}";
      case 3:
        String humanoid = noun.humanoid();
        String a = Morph.indefiniteA(humanoid);
        return "a tiny ${noun.artStyle()} portrait of $a $humanoid";
      case 4:
        String humanoid = noun.humanoid();
        String a = Morph.indefiniteA(humanoid);
        return "a small ${noun.artStyle()} portrait of your ${noun.familyMember()}";
      case 5:
        return "a ${noun.jewelry()} from your ${descriptor.gravelyIll()} ${noun.familyMember()}";
      case 6:
        return "a ${noun.book()} from your ${descriptor.kindly()} ${noun.familyMember()}";
      case 7:
        return "a locket with a ${noun.artStyle()} portrait of your ${noun.familyMember()} inside";
      case 8:
        String humanoid = Morph.heritage(noun.humanoid());
        return "a lock of hair (or horn) from your $humanoid friend";
      case 9:
        String jewelry = noun.jewelry();
        String a = Morph.indefiniteA(jewelry);
        return "$a ${noun.metalPrecious()} $jewelry that is a family heirloom";
      case 10:
        String foreign = descriptor.foreign();
        String a = Morph.indefiniteA(foreign);
        return "a small ${noun.toyMedieval()}, a gift from your ${noun.familyMember()} from their travels to $a $foreign ${noun.kingdom()}";
    }
    return trinket;
  }

  String getTrinketMacabre() {
    String trinket = "";

    int roll = DiceRoller.roll1d12();
    switch (roll) {
      case 1:
        return "a ${descriptor.macabre()} ${noun.humanoid()} ${noun.humanoidPart()}";
      case 2:
        String nightmarish = descriptor.macabre();
        String dream = noun.dream();
        return "a small ${noun.idol()} ${verb.depict()}ing ${Morph.indefiniteA(nightmarish)} $nightmarish ${noun.monsterTerror()} that gives you ${descriptor.scary()} ${Morph.addAnS(dream)}";
      case 3:
        return "a ${noun.textile()} ${noun.jewelry()} from which ${verb.dangle()} ${DiceRoller.roll1d4() + 1} ${descriptor.macabre()} ${noun.humanoid()} ${Morph.addAnS(noun.humanoidPart())}";
      case 4:
        return "a small ${noun.textile()} doll skewered with needles";
      case 5:
        String mineral = noun.mineral();
        String a = Morph.indefiniteA(mineral);
        String weird = descriptor.weird();
        String an = Morph.indefiniteA(weird);
        return "$a $mineral ${noun.container()} containing $an $weird ${noun.humanoidPart()} floating in pickling fluid";
      case 6:
        String container = noun.container();
        String a = Morph.indefiniteA(container);
        return "$a $container full of ${noun.humanoid()} ${noun.itemsMacabre()}";
      case 7:
        String material = descriptor.material();
        String a = Morph.indefiniteA(material);
        return "$a $material ${noun.container()} full of ${noun.humanoid()} ${noun.itemsMacabre()}";
      case 8:
        return "a ${descriptor.macabre()} ${noun.humanoidTiny()} inside a ${noun.mineral()} ${noun.container()}";
      case 9:
        String material = descriptor.material();
        String a = Morph.indefiniteA(material);
        return "$a $material eye";
      case 10:
        String prMetal = noun.metalPrecious();
        String a = Morph.indefiniteA(prMetal);
        return "$a $prMetal skull the size of your hand";
      case 11:
        return "the shell of an egg painted with scenes of human misery in disturbing detail";
      case 12:
        return "a ${descriptor.macabre()} ${noun.beastSmall()}";
    }
    return trinket;
  }

  String getTrinketMystical() {
    String trinket = "";

    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1:
        return "a ${noun.rockPiece()} of ${noun.mineral()} that faintly ${verb.ping()}s in ${noun.darkPlaces()}";
      case 2:
        String smpMetal = noun.metalAll();
        return "${Morph.indefiniteA(smpMetal)} $smpMetal ${noun.jewelry()} that never ${Morph.addAnS(verb.corrode())}";
      case 3:
        String old = descriptor.ancient();
        String an = Morph.indefiniteA(old);
        return "$an $old ${noun.wizardTraditions()} card bearing your likeness";
      case 4:
        String material = descriptor.material();
        String a = Morph.indefiniteA(material);
        return "$a $material orb filled with swirling smoke";
      case 5:
        String metal = noun.metalAll();
        String a = Morph.indefiniteA(metal);
        return "$a $metal orb etched with ${descriptor.weird()} runes";
      case 6:
        String shard = noun.rockPiece();
        String a = Morph.indefiniteA(shard);
        return "$a $shard of ${noun.mineral()} that always feels ${descriptor.feelsLike()} to the touch";
      case 7:
        return "a vest with one hundred tiny pockets";
      case 8:  "a small, weightless stone block";
      case 9: // A gemstone that looks like a lump of coal when examined by anyone but you
      case 10: // A candle that can't be lit
      case 11: // A small packet filled with pink dust
      case 12: // A bronze pentacle with an etching of a rat's head in its center
      case 13: // A purple handkerchief embroidered with the name of a powerful archmage
      case 14: // A bit of folded cloth that, when unfolded, turns into a stylish cap
      case 15: // A vial of dragon blood
      case 16: // A needle that never bends
      case 17: // A glass jar containing lard with a label that reads, "Griffon Grease"
      case 18:
        return "a blank ${noun.book()} whose pages refuse to hold writing of any kind";
      case 19:
      case 20:
      default:
    }
    return trinket;
  }

  String getTrinketNature() {
    String trinket = "";

    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1: // A bright green feather
      case 2: // A 1-pound egg with a bright red shell
      case 3: // A dead scarab beetle the size of your hand
      case 4: // A wooden box with a ceramic bottom that holds a living worm with a head on each end of its body
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
    }
    return trinket;
  }

  String getTrinketRomantic() {
    String trinket = "";
    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1: // An empty glass vial that smells of perfume when opened
      case 2: // A silver teardrop earring made from a real teardrop
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
    }
    return trinket;
  }

  String getTrinketScholarly() {
    String trinket = "";
    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1: //     return "a ${DiceRoller.roll1d4() + 1}-ounce ${noun.rockPiece()} made from an unknown mineral";
      case 2: // A multicolored stone disk
      case 3: // A rectangular metal device with two tiny metal cups on one end that throws sparks when wet
      case 4: // 	A mechanical canary inside a gnomish lamp
      case 5: // A metal can that has no opening but sounds as if it is filled with liquid, sand, spiders, or broken glass
      case 6: // A glass orb filled with water, in which swims a clockwork goldfish
      case 7: // A gold monocle frame without the lens
      case 8: // A sheet of parchment upon which is drawn a complex mechanical contraption
      case 9: // A tiny mechanical crab or spider that moves about when it's not being observed
      case 10: // A mosaic tile with a multicolored, glazed surface
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
    }
    return trinket;
  }

  String getTrinketTraveler() {
    String trinket = "";
    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1:
        String foreign = descriptor.foreign();
        String prMetal = noun.metalPrecious();
        return "${Morph.indefiniteA(prMetal)} $prMetal ${noun.coin()} ${Morph.pastTense(verb.mint())} in ${Morph.indefiniteA(foreign)} $foreign ${noun.kingdom()}";
      case 2:
        String diary = noun.journal();
        return "${Morph.indefiniteA(diary)} $diary written in a ${noun.language()} you don't ${verb.understand()}";
      case 3:
        String old = descriptor.ancient();
        return "${Morph.indefiniteA(old)} $old ${noun.game()} piece ${Morph.pastTense(verb.forge())} from ${noun.mineral()}";
      case 4:
        String lot = noun.assortment();
        String symb = noun.symbolOminous();
        return "${Morph.indefiniteA(lot)} $lot of ${noun.mineral()} dice, each with ${Morph.indefiniteA(symb)} $symb ${noun.symbol()} on their highest side";
      case 5:
        String parcel = noun.parcel();
        return "the ${noun.document()} to ${Morph.indefiniteA(parcel)} $parcel of land in a ${noun.kingdom()} unknown to you";
      case 6: // A tooth from an unknown beast
      case 7: // An enormous scale, perhaps from a dragon
      case 8: // A small wooden statuette of a smug halfling
      case 9: // 	An empty wine bottle bearing a pretty label that says, "The Wizard of Wines Winery, Red Dragon Crush, 331422-W"
      case 10: // A dragon's bony talon hanging from a plain leather necklace
      case 11: // A silver spoon with an 'M' engraved on the handle
      case 12: // An old key
      case 13: // An indecipherable treasure map
      case 14: // A cameo carved in the likeness of a hideous person
      case 15: // An invitation to a party where a murder happened
      case 16: // Half of a floorplan for a temple, castle, or some other structure
      case 17: // A receipt of deposit at a bank in a far-flung city
      case 18: // An empty silver snuffbox bearing an inscription on the surface that says "dreams"
      case 19: // An ornate brooch of dwarven design
      case 20:
    }

    return trinket;
  }

  String getTrinketWhimsical() {
    String trinket = "";
    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1: //A pipe that blows bubbles
      case 2: // A blank book whose pages refuse to hold ink, chalk, graphite, or any other substance or marking
      case 3: // A white, sequined glove sized for a human
      case 4: // A tiny chest carved to look like it has numerous feet on the bottom
      case 5: // A whistle made from gold-colored wood
      case 6: // A small box filled with different-sized buttons
      case 7: // A tiny cage with no door
      case 8: // A rabbit's foot
      case 9: // An alabaster mask
      case 10: // A nightcap that, when worn, gives you pleasant dreams
      case 11: // A 1-inch cube, each side painted a different color
      case 12: // A crystal knob from a door
      case 13: // A fragment of a beautiful song, written as musical notes on two pieces of parchment
      case 14: // A fan that, when unfolded, shows a sleeping cat
      case 15: // A set of bone pipes
      case 16: // A four-leaf clover pressed inside a book discussing manners and etiquette
      case 17: // A diary with seven missing pages
      case 18: // A book that tells the story of a legendary hero's rise and fall, with the last chapter missing
    }
    return trinket;
  }

  String getTrinketReligious() {
    String trinket = "";
    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1: // A tiny silver bell without a clapper
      case 2: //A pyramid of sticky black incense that smells very bad
      case 3: // An iron holy symbol devoted to an unknown god
      case 4: // A tiny silver icon of a raven
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
    }
    return trinket;
  }

  String getTrinketAll() {
    String trinket = "";
    int roll = DiceRoller.roll1d20();
    switch (roll) {}
    return trinket;
  }
}
