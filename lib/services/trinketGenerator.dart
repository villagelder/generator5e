import 'package:generator5e/services/onomasticonDescriptor.dart';

class TrinketGenerator {
  OnomasticonDescriptor descriptor = OnomasticonDescriptor();

  startup() async {
    while (!descriptor.isLoaded()) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  String getWord() {
    startup();
    return descriptor.macabre();
  }
}
