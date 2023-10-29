class TreasureGenerator5e {
  //
  //
  // Random random = Random();
  // int randNum = random.nextInt(30) + 1;
  // Treasures tr = treasuresList[randNum];
  // debugPrint(
  //     'ID: ${tr.id} Type: ${tr.type} CR: ${tr.challengeRating} Roll: ${tr.roll}');
  // return treasuresList;
  // }
}

String getFilePathByTopic(String topic) {
  String filePath = "generator5e/data/jsondata/";

  switch (topic) {
    case "treasures":
      {
        filePath = "generator5e/data/jsondata/treasuregen.json";
      }
      break;
    case "armors":
      {
        filePath = "generator5e/data/jsondata/armors.json";
      }
      break;
  }
  return filePath;
}

// static List<Treasures> getAllTreasures() {
//   Map<String, dynamic> treasureMap = readJsonFileAsString("treasures");
//   return Treasures.fromJson(treasureMap) as List<Treasures>;
// }

// Future<File> writeCounter(int counter) async {
//   final file = await _localFile;
//
//   // Write the file
//   return file.writeAsString('$counter');
// }
