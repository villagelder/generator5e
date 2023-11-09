class OnoWord {
  int id;
  String word;
  List<String> synonyms;

  OnoWord(this.id, this.word, this.synonyms);

  factory OnoWord.fromJson(Map<String, dynamic> json) {
    return OnoWord(json['id'] as int, json['word'] as String,
        List<String>.from(json['synonyms']));
  }

  @override
  String toString() {
    return '{ $id, $word, $synonyms }';
  }
}
