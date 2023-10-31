import 'dart:core';

class ArtItem {
  String roll;
  String value;
  String artobject;

  ArtItem(this.roll, this.value, this.artobject);

  factory ArtItem.fromJson(dynamic json) {
    return ArtItem(json['roll'] as String, json['value'] as String,
        json['artobject'] as String);
  }

  @override
  String toString() {
    return '{ $roll, $value, $artobject }';
  }
}
