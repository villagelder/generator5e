import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Equipment {
  String item;
  String category;
  List<String>? subtypes;
  String cost;
  String? weight;
  String source;

  Equipment(this.item, this.category, this.subtypes, this.cost, this.weight,
      this.source);

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
        json['item'] as String,
        json['category'] as String,
        json['subtypes'] as List<String>?,
        json['cost'] as String,
        json['weight'] as String?,
        json['source'] as String);
  }

  @override
  String toString() {
    return '{$item, $category, $subtypes, $cost, $weight, $source}';
  }
}
