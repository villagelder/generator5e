import 'dart:core';

class RandomMagicItem {
  String magictype;
  String minroll;
  String maxroll;
  String magicitem;

  RandomMagicItem(this.magictype, this.minroll, this.maxroll, this.magicitem);

  factory RandomMagicItem.fromJson(dynamic json) {
    return RandomMagicItem(
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
