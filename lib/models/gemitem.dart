import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GemItem {
  String roll;
  String value;
  String stone;
  List colors;

  GemItem(this.roll, this.value, this.stone, this.colors);

  factory GemItem.fromJson(Map<String, dynamic> json) {
    return GemItem(json['roll'] as String, json['value'] as String,
        json['stone'] as String, json['colors'] as List);
  }

  @override
  String toString() {
    return '{ $roll, $value, $stone, $colors }';
  }
}
