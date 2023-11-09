import 'package:generator5e/services/onomasticonDescriptor.dart';

class TrinketGenerator {
  OnomasticonDescriptor descriptor = OnomasticonDescriptor();
  late String synonym;

  String generateTrinket()  {
    while (!descriptor.isLoaded()) {
       Future.delayed(const Duration(milliseconds: 100));
    }

    return descriptor.macabre();
  }
}
