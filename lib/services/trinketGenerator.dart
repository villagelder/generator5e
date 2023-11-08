import 'package:generator5e/services/onomasticonDescriptor.dart';
import 'package:generator5e/services/onomasticonNouns.dart';
import 'package:generator5e/services/onomasticonVerbs.dart';

import '../models/onoword.dart';

class TrinketGenerator {
  List _nouns = [];
  List<OnoWord> nounsObjList = [];

  String generateTrinket(){

    OnomasticonNoun noun = OnomasticonNoun();

    OnomasticonDescriptor descriptor = OnomasticonDescriptor();

    return "A ${descriptor.macabre()} ${noun.humanoid()} ${noun.humanoidPart()}";


  }


}