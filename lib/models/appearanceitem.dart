import 'dart:core';

class AppearanceItem {
  String race;
  String subrace;
  String frillName;
  List<String> skinColors;
  List<String> eyeColors;
  List<String> frillTypes;
  List<String> hairColors;
  List<String>? tails;

  AppearanceItem(this.race, this.subrace, this.frillName, this.skinColors,
      this.eyeColors, this.frillTypes, this.hairColors, this.tails);

  factory AppearanceItem.fromJson(dynamic json) {
    return AppearanceItem(
        json['race'] as String,
        json['subrace'] as String,
        json['frillName'] as String,
        List<String>.from(json['skinColors']),
        List<String>.from(json['eyeColors']),
        List<String>.from(json['frillTypes']),
        List<String>.from(json['hairColors']),
        List<String>.from(json['tails']));
  }

  @override
  String toString() {
    return '{ $race, $subrace, $frillName, $frillTypes, $skinColors,'
        '$eyeColors, $tails }';
  }
}
