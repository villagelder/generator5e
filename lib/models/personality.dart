import 'dart:core';

class Personality {
  String id;
  String background;
  String characteristic;
  String specialty;
  String dieroll;
  String traitname;
  String description;
  String source;

  Personality(this.id, this.background, this.characteristic, this.specialty,
      this.dieroll, this.traitname, this.description, this.source);

  factory Personality.fromJson(dynamic json) {
    return Personality(
        json['id'] as String,
        json['background'] as String,
        json['characteristic'] as String,
        json['specialty'] as String,
        json['dieroll'] as String,
        json['traitname'] as String,
        json['description'] as String,
        json['source'] as String);
  }

  @override
  String toString() {
    return '{ $id, $background, $characteristic, $specialty, $dieroll, $traitname, $description, $source }';
  }
}
