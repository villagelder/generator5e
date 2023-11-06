import 'dart:core';

class TreasureMagicItem {
  String magictype;
  String minroll;
  String maxroll;
  String magicitem;

  TreasureMagicItem(this.magictype, this.minroll, this.maxroll, this.magicitem);

  factory TreasureMagicItem.fromJson(dynamic json) {
    return TreasureMagicItem(
        json['magictype'] as String,
        json['minroll'] as String,
        json['maxroll'] as String,
        json['magicitem'] as String);
  }

  @override
  String toString() {
    return '{ $magictype, $minroll, $maxroll, $magicitem }';
  }
}
