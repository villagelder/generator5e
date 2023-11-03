import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Spell {
  String name;
  String? description;
  String? higherLevel;
  String? source;
  String? range;
  String? components;
  String? material;
  String? ritual;
  String? duration;
  String? concentration;
  String? castingTime;
  String? level;
  String? school;
  String? classes;
  String? archetypes;
  String? domains;
  String? oaths;
  String? patrons;
  String? circles;

  Spell(
      this.name,
      this.description,
      this.higherLevel,
      this.source,
      this.range,
      this.components,
      this.material,
      this.ritual,
      this.duration,
      this.concentration,
      this.castingTime,
      this.level,
      this.school,
      this.classes,
      this.archetypes,
      this.domains,
      this.oaths,
      this.patrons,
      this.circles);

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
        json['name'] as String,
        json['description'] as String?,
        json['higherLevel'] as String?,
        json['source'] as String?,
        json['range'] as String?,
        json['components'] as String?,
        json['material'] as String?,
        json['ritual'] as String?,
        json['duration'] as String?,
        json['concentration'] as String?,
        json['castingTime'] as String?,
        json['level'] as String?,
        json['school'] as String?,
        json['classes'] as String?,
        json['archetypes'] as String?,
        json['domains'] as String?,
        json['oaths'] as String?,
        json['patrons'] as String?,
        json['circles'] as String?);
  }

  @override
  String toString() {
    return '{$name, $description, $source, $range, $components, $material, $ritual, $duration, '
        '$concentration, $castingTime, $level, $school, $classes, $archetypes, $domains, $oaths, '
        '$patrons, $circles }';
  }
}
