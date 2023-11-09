class OnoWord {
  int id;
  String type;
  List<String> synonyms;

  OnoWord(this.id, this.type, this.synonyms);

  factory OnoWord.fromJson(Map<String, dynamic> json) {
    return OnoWord(json['id'] as int, json['type'] as String,
       (json['synonyms']).toList(growable: true));
  }

  @override
  String toString() {
    return '{ $id, $type, $synonyms }';
  }
}
