import 'dart:math';

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
        case "whimsical":
          trinketList.add(getTrinketWhimsical());
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

  List<String> generateTrinketsArray(String type, String number) {
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
        case "whimsical":
          trinketList.add(getTrinketWhimsical());
          break;
        default:
          trinketList.add(getTrinketAll());
      }
    }

    return trinketList;
  }

  String getTrinketMartial() {
    String trinket = "a martial trinket";
    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1:
        return "a pair of old ${noun.thingsInPairs()}";
      case 2:
        return "a helm handed down from your ${noun.familyMember()}";
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
    String trinket = "a sentimental trinket";
    int roll = DiceRoller.roll1d12();
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
      case 11:
        return "a tiny ${noun.itemsArtistic()} that reminds you of your childhood";
      case 12:
        return "a small ${noun.toyMedieval()} from your childhood";
    }
    return trinket;
  }

  String getTrinketMacabre() {
    String trinket = "a macabre trinket";

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
        String human = Morph.heritage(noun.humanoid());
        return "the ${noun.itemsArtistic()} painted with scenes of $human misery in disturbing detail";
      case 12:
        return "a ${descriptor.macabre()} ${noun.beastSmall()}";
    }
    return trinket;
  }

  String getTrinketMystical() {
    String trinket = "a mystical trinket";

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
        String clothing = noun.itemClothing();
        String a = Morph.indefiniteA(clothing);
        return "$a $clothing with one hundred tiny pockets";
      case 8:
        return "a small, weightless ${noun.mineral()} ${noun.rockPiece()}";
      case 9:
        String rockPiece = noun.rockPiece();
        String a = Morph.indefiniteA(rockPiece);
        return "a ${noun.gemPrecious()} that looks like $a $rockPiece of ${noun.mineral()} when examined by anyone but you";
      case 10:
        return "a ${descriptor.colorsBase()} ${noun.lightSource()} that can't be lit";
      case 11:
        return "a small ${noun.bag()} filled with ${descriptor.colorsBase()} ${noun.powder()}";
      case 12:
        String metal = noun.metalAll();
        String a = Morph.indefiniteA(metal);
        return "a $metal ${noun.symbolMagic()} with an etching of ${noun.beastSmall()}'s head";
      case 13:
        String color = descriptor.colorsBase();
        String a = Morph.indefiniteA(color);
        return "$a $color ${noun.neckwear()} embroidered with the name of of a powerful ${noun.heroesAndVillains()}";
      case 14:
        return "a bit of folded ${noun.textile()} that, when unfolded, turns into a stylish ${noun.itemClothing()}";
      case 15:
        String potion = noun.potion();
        String a = Morph.indefiniteA(potion);
        return "$a $potion of ${noun.humanoidTiny()} blood";
      case 16:
        String potion = noun.potion();
        String a = Morph.indefiniteA(potion);
        return "$a $potion of ${noun.dragon()} blood";
      case 17:
        String mineral = noun.mineral();
        String a = Morph.indefiniteA(mineral);
        return '$a $mineral ${noun.container()} containing a strange substance with a label that reads, "${noun.monstrosity()} ${noun.ingredients()}"';
      case 18:
        return "a blank ${noun.book()} whose pages refuse to hold writing of any kind";
      case 19:
        String tool = noun.toolSmall();
        String a = Morph.indefiniteA(tool);
        return "$a $tool that never breaks";
      case 20:
        String caster = noun.classesCaster();
        return "a mysterious wand with the name of an ancient $caster engraved on it";
    }
    return trinket;
  }

  String getTrinketNature() {
    String trinket = "a nature trinket";

    int roll = DiceRoller.roll1d10();
    switch (roll) {
      case 1:
        String glistening = descriptor.glistening();
        String a = Morph.indefiniteA(glistening);
        return "$a $glistening ${descriptor.colorsBase()} feather";
      case 2:
        String glistening = descriptor.glistening();
        String a = Morph.indefiniteA(glistening);
        return "a large egg with $a $glistening shell";
      case 3:
        "a dead ${noun.beastSmall} the size of your hand";
      case 4:
        String material = descriptor.material();
        String a = Morph.indefiniteA(material);
        return "$a $material ${noun.container()} that holds a living ${noun.beastSmall()} with a head on each end of its body";
      case 5:
        return "the chunk of a wing from a ${noun.monsterWinged()}";
      case 6:
        return "the horn from a ${noun.monsterHorned()}";
      case 7:
        return "a piece of hide from a ${noun.beastMammalFierce()}";
      case 8:
        return "the skeleton of a ${noun.beastAmphibian()}";
      case 9:
        return "a feather from a ${noun.beastBird()}";
      case 10:
        String assortment = noun.assortment();
        String a = Morph.indefiniteA(assortment);
        String container = noun.container();
        return "a ${noun.assortment()} of ${Morph.addAnS(noun.beastInsect())} in a decorative $container";
    }
    return trinket;
  }

  String getTrinketRomantic() {
    String trinket = "a romantic trinket";
    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1:
        return "an empty ${noun.mineral()} ${noun.potion()} that smells of perfume when opened";
      case 2:
        String prMetal = noun.metalPrecious();
        String a = Morph.indefiniteA(prMetal);
        return "$a $prMetal teardrop earring made from a real teardrop";
      case 3:
        return "a lock of hair from your true love";
      case 4:
        String prMetal = noun.metalPrecious();
        String a = Morph.indefiniteA(prMetal);
        return "$a $prMetal ${noun.jewelry()} with your lover's name etched on it";
      case 5:
        return "a tiny ${noun.artStyle()} portrait of your ${noun.humanoid()} love";
      case 6:
        return "a ${noun.book()} of ${Morph.addAnS(noun.loveExpression())} given to you by your love";
      case 7:
        return "a ${noun.book()} of ${Morph.addAnS(noun.loveExpression())} that reminds you of your love";
      case 8:
        String color = descriptor.colorsBase();
        String a = Morph.indefiniteA(color);
        return "$a $color ribbon given to you before your journey by your lover";
      case 9:
        return "a wooden carving that was a gift from your one true love";
      case 10:
        return "a ${noun.neckwear()} that still smells like your love";
      case 11:
        return "an enchanted ${noun.jewelry()} from your love";
      case 12:
        return "a small ${noun.potion()} of your love's perfume on a necklace";
      case 13:
        return "a pressed flower enclosed in a book from your love";
      case 14:
        return "a small ${noun.mineral()} carving that reminds you of your love";
      case 15:
        return "a horn carved with elaborate runes expressing love";
      case 16:
        return "a coin hanging from a chain given to you by your love";
      case 17:
        return "a small branch wrapped with ${descriptor.colorsBase()} ribbon as a gift from your love";
      case 18:
        return "a decorative shell with the name of your love etched inside";
      case 19:
        String animal = "";
        int roll = DiceRoller.roll1d4();
        switch (roll) {
          case 1:
            animal = noun.beastAmphibian();
            break;
          case 2:
            animal = noun.beastMammalFierce();
            break;
          case 3:
            animal = noun.beastReptile();
            break;
          case 4:
            animal = noun.beastSea();
            break;
        }
        String a = Morph.indefiniteA(animal);
        return "a small pendant in the shape of $a $animal, a gift from your love";
      case 20:
        String letter = noun.loveExpression();
        String a = Morph.indefiniteA(letter);
        return "a love $letter written from your love";
    }
    return trinket;
  }

  String getTrinketScholarly() {
    String trinket = "a scholarly trinket";
    int roll = DiceRoller.roll1d10();
    switch (roll) {
      case 1:
        return "a ${DiceRoller.roll1d6() + 1}-ounce ${noun.rockPiece()} made from an unknown mineral";
      case 2:
        String symbol = noun.symbolMagic();
        String a = Morph.indefiniteA(symbol);
        return "a multicolored stone disk ${Morph.pastTense(verb.inscribe())} with $a $symbol";
      case 3:
        String geometric = descriptor.geometric();
        String a = Morph.indefiniteA(geometric);
        return "$a $geometric ${descriptor.material()} device that ${Morph.addAnS(verb.ping())} when wet";
      case 4:
        String itemType = descriptor.itemType();
        String gnomish = Morph.heritage(noun.humanoid());
        String an = Morph.indefiniteA(gnomish);
        String animal = "";
        int roll = DiceRoller.roll1d4();
        switch (roll) {
          case 1:
            animal = noun.beastBird();
            break;
          case 2:
            animal = noun.beastReptile();
            break;
          case 3:
            animal = noun.beastApeMonkey();
            break;
          case 4:
            animal = noun.beastMammalMild();
            break;
        }
        return "a small $itemType ${noun.beastBird()} inside $an $gnomish lamp";
      case 5:
        String material = descriptor.material();
        String a = Morph.indefiniteA(material);
        return "$a $material ${noun.container()} that has no opening but sounds hollow with an unknown material inside";
      case 6:
        return "a glass orb filled with water, in which swims a clockwork goldfish";
      case 7:
        String metal = noun.metalAll();
        String a = Morph.indefiniteA(metal);
        return "$a $metal ${noun.eyeGlass()} frame without the lens";
      case 8:
        return "a sheet of ${noun.paper()} upon which is drawn a ${descriptor.itemType()} contraption";
      case 9:
        return "a tiny ${descriptor.itemType()} ${noun.beastArachnid()} that moves about when it's not being observed";
      case 10:
        return "a mosaic tile with a multicolored, glazed surface";
    }
    return trinket;
  }

  String getTrinketTraveler() {
    String trinket = "a traveler trinket";
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
      case 6:
        String part = noun.monsterPart();
        String a = Morph.indefiniteA(part);
        return "$a $part from an unknown creature";
      case 7:
        return "an enormous scale, perhaps from a ${noun.dragon()}";
      case 8:
        return "a small ${descriptor.material()} ${noun.idol()} of a smug ${noun.humanoid()}";
      case 9:
        String a = DiceRoller.roll1d4().toString();
        String b = (DiceRoller.roll1d10() - 1).toString();
        String c = (DiceRoller.roll1d10() - 1).toString();
        String d = (DiceRoller.roll1d10() - 1).toString();
        String e = (DiceRoller.roll1d10() - 1).toString();
        String f = (DiceRoller.roll1d10() - 1).toString();
        String batch = a + b + c + d + e + f;

        return "an empty ${noun.drinkAlcohol()} bottle bearing a pretty label that says, 'The Artificer of Alcohols Distillery, ${descriptor.colorsBase()} ${noun.dragon()} Series, $batch-A'";
      case 10:
        return "a ${noun.dragon()}'s bony talon hanging from a plain ${noun.textile()} necklace";
      case 11:
        String metal = descriptor.material();
        String a = Morph.indefiniteA(metal);
        return "$a $metal ${noun.utensilsKitchen()} with the letter '${noun.letterCapital()}' engraved on it";
      case 12:
        return "an old ${noun.toolSmall()}";
      case 13:
        return "an indecipherable treasure map";
      case 14:
        "a ${noun.brooch()} carved in the likeness of a hideous ${noun.humanoid()}";
      case 15:
        return "an invitation to a party where a murder happened";

      case 16:
        return "half of a floorplan of a ${noun.building()}";
      case 17: // A receipt of deposit at a bank in a far-flung city
      case 18: // An empty silver snuffbox bearing an inscription on the surface that says "dreams"
      case 19: // An ornate brooch of dwarven design
      case 20:
    }

    return trinket;
  }

  String getTrinketWhimsical() {
    String trinket = "a whimsical trinket";
    int roll = DiceRoller.roll1d20();
    switch (roll) {
      case 1:
        return "a pipe that blows ${noun.itemsWhimsical()}";
      case 2:
        return "a blank book whose pages refuse to hold writing of any kind";
      case 3:
        String color = descriptor.colorsBase();
        String a = Morph.indefiniteA(color);
        return "$a $color, sequined ${noun.itemClothing()} sized for a ${noun.humanoid()}";
      case 4:
        String crafted = Morph.pastTense(verb.forge());
        return "a small ${noun.container()} $crafted to look like it has numerous feet on the bottom";
      case 5:
        return "a ${noun.noisemaker()} made from ${descriptor.colorsBase()}-colored wood";
      case 6:
        return "a small ${noun.container()} filled with different-sized ${Morph.addAnS(noun.itemSmall())}";
      case 7:
        return "a tiny cage with no door";
      case 8:
        return "a ${noun.beastMammalMild()}'s foot";
      case 9:
        String mineral = noun.mineral();
        String a = Morph.indefiniteA(mineral);
        return "$a $mineral mask";
      case 10:
        String clothingItem = noun.itemClothing();
        String a = Morph.indefiniteA(clothingItem);
        return "$a $clothingItem that, when worn, gives you pleasant dreams";
      case 11:
        return "a ${DiceRoller.roll1d6().toString()}-inch cube, each side painted a different color";
      case 12:
        String mineral = noun.mineral();
        String a = Morph.indefiniteA(mineral);
        return "$a $mineral knob from a door";
      case 13:
        return "a fragment of a song, written as musical notes on two pieces of ${noun.paper()}";
      case 14:
        String actioning = Morph.addIng(verb.actionSimple());
        String a = Morph.indefiniteA(actioning);
        return "a fan that, when unfolded, shows $a $actioning ${noun.beastMammalFierce()}";
      case 15:
        return "a set of ${descriptor.material()} pipes";
      case 16:
        return "a four-leaf clover pressed inside a book on ${noun.topicBook()}";
      case 17:
        return "a ${noun.journal()} with ${(DiceRoller.roll1d12() + 1).toString()} missing pages";
      case 18:
        String book = noun.book();
        String a = Morph.indefiniteA(book);
        return "$a $book that tells the story of a legendary ${noun.heroesAndVillains()}'s rise and fall";
      case 19:
        String book = noun.book();
        String a = Morph.indefiniteA(book);
        return "$a $book that tells the story of a legendary ${noun.heroesAndVillains()}'s rise and fall, with the last chapter missing";
      case 20:
        return "a set of costume fairy wings that can be worn on your back";
    }
    return trinket;
  }

  String getTrinketReligious() {
    String trinket = "a religious trinket";
    int roll = DiceRoller.roll1d4();
    switch (roll) {
      case 1:
        return "a tiny silver bell without a clapper";
      case 2:
        String shape = noun.shape3D();
        String a = Morph.indefiniteA(shape);

        return "$a $shape of sticky ${descriptor.colorsBase()} incense that smells very bad";
      case 3:
        String metal = noun.metalAll();
        String a = Morph.indefiniteA(metal);
        return "$a $metal holy symbol devoted to an unknown god";
      case 4:
        int roll = DiceRoller.roll1d4();
        String animal = "";
        switch (roll) {
          case 1:
            animal = noun.beastBird();
            break;
          case 2:
            animal = noun.beastReptile();
            break;
          case 3:
            animal = noun.beastMammalFierce();
            break;
          case 4:
            animal = noun.beastSea();
            break;
        }
        return "a tiny ${noun.metalPrecious()} ${noun.idol()} of a $animal";
    }
    return trinket;
  }

  String getTrinketAll() {
    String trinket = "";
    int roll = DiceRoller.roll1d10();
    switch (roll) {
      case 1:
        trinket = getTrinketSentimental();
        break;
      case 2:
        trinket = getTrinketMacabre();
        break;
      case 3:
        trinket = getTrinketMartial();
        break;
      case 4:
        trinket = getTrinketNature();
        break;
      case 5:
        trinket = getTrinketReligious();
        break;
      case 6:
        trinket = getTrinketRomantic();
        break;
      case 7:
        trinket = getTrinketScholarly();
        break;
      case 8:
        trinket = getTrinketMystical();
        break;
      case 9:
        trinket = getTrinketTraveler();
        break;
      case 10:
        trinket = getTrinketWhimsical();
        break;
    }
    return trinket;
  }
}
