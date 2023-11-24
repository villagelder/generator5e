import 'dart:core';

class WildMagicItem {
  String title;
  Map<String, String> table;


  WildMagicItem(this.title, this.table);

  factory WildMagicItem.fromJson(dynamic json) {
    return WildMagicItem(json['title'] as String, Map<String, String>.from(json['table']));
  }

  @override
  String toString() {
    return '{ $title, $table }';
  }
}
