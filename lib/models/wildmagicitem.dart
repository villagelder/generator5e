import 'dart:core';

class WildMagicItem {
  String title;
  String dice;
  Map<String, String> table;

  WildMagicItem(this.title, this.dice, this.table);

  factory WildMagicItem.fromJson(dynamic json) {
    return WildMagicItem(json['title'] as String, json['dice'] as String,
        Map<String, String>.from(json['table']));
  }

  @override
  String toString() {
    return '{ $title, $table, $dice}';
  }
}
