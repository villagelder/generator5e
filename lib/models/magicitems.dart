import 'dart:core';

class MagicItem {
  String magictype;
  String minroll;
  String maxroll;
  String magicitem;

  MagicItem(this.magictype, this.minroll, this.maxroll, this.magicitem);

  factory MagicItem.fromJson(dynamic json) {
    return MagicItem(json['magictype'] as String, json['minroll'] as String,
        json['maxroll'] as String, json['magicitem'] as String);
  }

  @override
  String toString() {
    return '{ $magictype, $minroll, $maxroll, $magicitem }';
  }
}
