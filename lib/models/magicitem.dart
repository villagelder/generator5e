import 'dart:core';

class MagicItem {
  int id;
  String name;
  String type;
  String subtypes;
  String total;
  String detail;
  bool attunement;
  String rarity;
  String description;
  String source;

  MagicItem(this.id, this.name, this.type, this.subtypes, this.total,
      this.detail, this.attunement, this.rarity, this.description, this.source);

  factory MagicItem.fromJson(dynamic json) {
    return MagicItem(
        json['id'] as int,
        json['name'] as String,
        json['type'] as String,
        json['subtypes'] as String,
        json['total'] as String,
        json['detail'] as String,
        json['attunement'] as bool,
        json['rarity'] as String,
        json['description'] as String,
        json['source'] as String);
  }

  @override
  String toString() {
    return '{ $id, $name, $type, $subtypes, $total, $detail, $attunement, $rarity, $description, $source }';
  }
}
