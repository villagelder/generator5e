import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SpellsKnown {
  String className;
  int level;
  int cantrips;
  int spellsKnown;
  int lvl1;
  int lvl2;
  int lvl3;
  int lvl4;
  int lvl5;
  int lvl6;
  int lvl7;
  int lvl8;
  int lvl9;
  String source;

  SpellsKnown(
      this.className,
      this.level,
      this.cantrips,
      this.spellsKnown,
      this.lvl1,
      this.lvl2,
      this.lvl3,
      this.lvl4,
      this.lvl5,
      this.lvl6,
      this.lvl7,
      this.lvl8,
      this.lvl9,
      this.source);

  factory SpellsKnown.fromJson(Map<String, dynamic> json) {
    return SpellsKnown(
        json['className'] as String,
        json['level'] as int,
        json['cantrips'] as int,
        json['spellsKnown'] as int,
        json['lvl1'] as int,
        json['lvl2'] as int,
        json['lvl3'] as int,
        json['lvl4'] as int,
        json['lvl5'] as int,
        json['lvl6'] as int,
        json['lvl7'] as int,
        json['lvl8'] as int,
        json['lvl9'] as int,
        json['source'] as String);
  }

  Map<String, dynamic> toJson() => {
        'className': className,
        'level': level,
        'cantrips': cantrips,
        'spellsKnown': spellsKnown,
        'lvl1': lvl1,
        'lvl2': lvl2,
        'lvl3': lvl3,
        'lvl4': lvl4,
        'lvl5': lvl5,
        'lvl6': lvl6,
        'lvl7': lvl7,
        'lvl8': lvl8,
        'lvl9': lvl9,
        'source': source,
      };

  @override
  String toString() {
    return '{ $className, $level, $cantrips, $spellsKnown, $lvl1, $lvl2, $lvl3, $lvl4, $lvl5, $lvl6, $lvl7, $lvl8, $lvl9, $source }';
  }
}
