import 'dart:core';

class Name {
  int id;
  String race;
  List<String> maleFirstNames;
  List<String> femaleFirstNames;
  List<String> lastNames;
  List<String>? thirdNames;
  String? moniker;

  Name(this.id, this.race, this.maleFirstNames, this.femaleFirstNames,
      this.lastNames, this.thirdNames, this.moniker);

  factory Name.fromJson(dynamic json) {
    return Name(
        json['id'] as int,
        json['race'] as String,
        List<String>.from(json['malefirstnames']),
        List<String>.from(json['femalefirstnames']),
        List<String>.from(json['lastnames']),
        List<String>.from(json['thirdnames']),
        json['moniker'] as String);
  }

  @override
  String toString() {
    return '{ $id, $race, $maleFirstNames, $femaleFirstNames, $lastNames, $thirdNames, $moniker }';
  }
}
