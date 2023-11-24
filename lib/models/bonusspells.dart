import 'dart:core';

class BonusSpells {
  String classname;
  String subclass;
  String? choice;
  bool expanded;
  List<String>? cantrips;
  int minforlvl1;
  int minforlvl2;
  int minforlvl3;
  int minforlvl4;
  int minforlvl5;
  int minforlvl6;
  int minforlvl7;
  int minforlvl8;
  int minforlvl9;
  List<String>? level1;
  List<String>? level2;
  List<String>? level3;
  List<String>? level4;
  List<String>? level5;
  List<String>? level6;
  List<String>? level7;
  List<String>? level8;
  List<String>? level9;

  BonusSpells(
      this.classname,
      this.subclass,
      this.choice,
      this.expanded,
      this.cantrips,
      this.minforlvl1,
      this.minforlvl2,
      this.minforlvl3,
      this.minforlvl4,
      this.minforlvl5,
      this.minforlvl6,
      this.minforlvl7,
      this.minforlvl8,
      this.minforlvl9,
      this.level1,
      this.level2,
      this.level3,
      this.level4,
      this.level5,
      this.level6,
      this.level7,
      this.level8,
      this.level9);

  factory BonusSpells.fromJson(dynamic json) {
    return BonusSpells(
        json['classname'] as String,
        json['subclass'] as String,
        json['choice'] as String?,
        json['expanded' as bool],
        List<String>.from(json['cantrips']),
        json['minforlvl1'] as int,
        json['minforlvl2'] as int,
        json['minforlvl3'] as int,
        json['minforlvl4'] as int,
        json['minforlvl5'] as int,
        json['minforlvl6'] as int,
        json['minforlvl7'] as int,
        json['minforlvl8'] as int,
        json['minforlvl9'] as int,
        List<String>.from(json['level1']),
        List<String>.from(json['level2']),
        List<String>.from(json['level3']),
        List<String>.from(json['level4']),
        List<String>.from(json['level5']),
        List<String>.from(json['level6']),
        List<String>.from(json['level7']),
        List<String>.from(json['level8']),
        List<String>.from(json['level9']));
  }

  @override
  String toString() {
    return '{ $classname, $subclass, $choice, $expanded, $cantrips, $minforlvl1,'
        '$minforlvl2, $minforlvl3, $minforlvl4, $minforlvl5, $minforlvl6, $minforlvl7,'
        '$minforlvl8, $minforlvl9, $level1, $level2, $level3, $level4, $level5, $level6, $level7, $level8, $level9 }';
  }
}
