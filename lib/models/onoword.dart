import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OnoWord {
  int id;
  String type;
  List<String> elements;

  OnoWord(this.id, this.type, this.elements);

  factory OnoWord.fromJson(dynamic json) {
    return OnoWord(json['id'] as int, json['type'] as String,
        json['elements'] as List<String>);
  }

  @override
  String toString() {
    return '{ $int, $type, $elements }';
  }
}
