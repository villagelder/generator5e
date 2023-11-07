import 'package:generator5e/services/onomasticonDescriptor.dart';
import 'package:generator5e/services/onomasticonNouns.dart';
import 'package:generator5e/services/onomasticonVerbs.dart';

class TrinketGenerator {


  String generateTrinket(){


    OnomasticonNoun noun = OnomasticonNoun();
    OnomasticonVerb verb = OnomasticonVerb();
    OnomasticonDescriptor descriptor = OnomasticonDescriptor();

    return "A ${descriptor.macabre()} ${noun.humanoid()} ${noun.humanoidPart()}";


  }


}