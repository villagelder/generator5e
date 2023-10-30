import 'dart:core';

class Treasures {
  int id;
  String type;
  int challengeRating;
  int roll;
  String copper;
  String silver;
  String electrum;
  String gold;
  String platinum;
  int cpmultiplier;
  int spmultiplier;
  int epmultiplier;
  int gpmultiplier;
  int ppmultiplier;
  String gems;
  int gemsvalue;
  String art;
  int artvalue;
  String magicitems;
  String magicitemtype;

  Treasures(
      this.id,
      this.type,
      this.challengeRating,
      this.roll,
      this.copper,
      this.silver,
      this.electrum,
      this.gold,
      this.platinum,
      this.cpmultiplier,
      this.spmultiplier,
      this.epmultiplier,
      this.gpmultiplier,
      this.ppmultiplier,
      this.gems,
      this.gemsvalue,
      this.art,
      this.artvalue,
      this.magicitems,
      this.magicitemtype);

  factory Treasures.fromJson(dynamic json) {
    return Treasures(
        json['id'] as int,
        json['type'] as String,
        json['challengeRating'] as int,
        json['roll'] as int,
        json['copper'] as String,
        json['silver'] as String,
        json['electrum'] as String,
        json['gold'] as String,
        json['platinum'] as String,
        json['cpmultiplier'] as int,
        json['spmultiplier'] as int,
        json['epmultiplier'] as int,
        json['gpmultiplier'] as int,
        json['ppmultiplier'] as int,
        json['gems'] as String,
        json['gemsvalue'] as int,
        json['art'] as String,
        json['artvalue'] as int,
        json['magicitems'] as String,
        json['magicitemtype'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.type}, ${this.challengeRating}, ${this.roll}, ${this.copper}, ${this.silver},    ${this.electrum}, ${this.gold}, ${this.platinum}, ${this.cpmultiplier}, ${this.spmultiplier}, ${this.epmultiplier},${this.gpmultiplier}, ${this.ppmultiplier}, ${this.gems}, ${this.gemsvalue}, ${this.art}, ${this.artvalue},${this.magicitems}, ${this.magicitemtype} }';
  }
}
