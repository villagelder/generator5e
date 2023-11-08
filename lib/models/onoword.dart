import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OnoWord {
  int id;
  String? type;
  List<String> synonyms;

  OnoWord(this.id, this.type, this.synonyms);

  factory OnoWord.fromJson(Map<String, dynamic> json) {
    return OnoWord(json['id'] as int, json['type'] as String,
       List.from(json['synonyms']) as List<String>);
  }

  @override
  String toString() {
    return '{ $id, $type, $synonyms }';
  }
}
