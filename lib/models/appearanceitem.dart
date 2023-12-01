import 'dart:core';

class AppearanceItem {
  String race;
  String subrace;
  String frillName;
  List<String> frillTypes;
  List<String> frillColors;
  List<String> skinColors;
  List<String> eyeColors;

  AppearanceItem(this.race, this.subrace, this.frillName, this.frillTypes,
      this.frillColors, this.skinColors, this.eyeColors);

  factory AppearanceItem.fromJson(dynamic json) {
    return AppearanceItem(
        json['race'] as String,
        json['subraces'] as String,
        json['frillName'] as String,
        List<String>.from(json['frillTypes']),
        List<String>.from(json['frillColors']),
        List<String>.from(json['skinColors']),
        List<String>.from(json['eyeColors']));
  }

  @override
  String toString() {
    return '{ $race, $subrace, $frillName, $frillTypes, $frillColors, $skinColors,'
        '$eyeColors }';
  }
}
