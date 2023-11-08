class OnoWord {
  final int id;
  final String word;
  final List<String> synonyms;

  OnoWord({required this.id, required this.word, required this.synonyms});

  factory OnoWord.fromJson(Map<String, dynamic> json) {
    return OnoWord(
        id: json['id'],
        word: json['word'],
        synonyms: List<String>.from(json['synonyms']));
  }

  @override
  String toString() {
    return '{ $id, $word, $synonyms }';
  }
}
