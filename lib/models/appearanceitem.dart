import 'dart:core';

class AppearanceItem {
  String race;
  String subrace;
  String frillName;
  List<String> frillTypes;
  List<String> frillColors;
  List<String> skinColors;
  List<String> descriptors;
  List<String> eyeColors;
  List<String> hairstyles;
  List<String> facialHair;

  AppearanceItem(
      this.race,
      this.subrace,
      this.frillName,
      this.frillTypes,
      this.frillColors,
      this.skinColors,
      this.descriptors,
      this.eyeColors,
      this.hairstyles,
      this.facialHair);

  factory AppearanceItem.fromJson(dynamic json) {
    return AppearanceItem(
        json['race'] as String,
        json['subraces'] as String,
        json['frillName'] as String,
        List<String>.from(json['frillTypes']),
        List<String>.from(json['frillColors']),
        List<String>.from(json['skinColors']),
        List<String>.from(json['descriptors']),
        List<String>.from(json['eyeColors']),
        List<String>.from(json['hairstyles']),
        List<String>.from(json['facialHair']));
  }

  @override
  String toString() {
    return '{ $race, $subrace, $frillName, $frillTypes, $frillColors, $skinColors,'
        '$descriptors, $eyeColors, $hairstyles, $facialHair }';
  }
}
