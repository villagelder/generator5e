class Morph {
  static List vowelsStrict = ['a', 'e', 'i', 'o', 'u'];

  static String pastTense(String word) {
    word = word.toLowerCase();
    if (word == "make") {
      return "made";
    }

    if (word.endsWith('e')) {
      return '${word}d';
    } else if (!word.endsWith("ey") && word.endsWith("y")) {
      return '${word}ied';
    }
    return '${word}ed';
  }

  static String indefiniteA(String word) {
    word = word.toLowerCase();
    if (!vowelsStrict.contains(word[0])) {
      return "a";
    }
    return "an";
  }

  static String addAnS(String word) {
    word = word.toLowerCase();
    if (word.endsWith("sh")) {
      return "${word}es";
    }

    if (word.endsWith("y")) {
      return "${word}ies";
    }
    return "${word}s";
  }

  static String heritage(String race) {
    race = race.toLowerCase();

    switch (race) {
      case "dwarf":
        return "dwarven";
      case "elf":
        return "elven";
      case "half-elf":
        return "half-elven";
      case "half-orc":
        return "half-orcish";
      case "gnome":
        return "gnomish";
      case "orc":
        return "orcish";
      case "aarakocra":
        return "aarakocran";
      case "aasimar":
        return "aasimarian";
      default:
        return race;
    }
  }
}
