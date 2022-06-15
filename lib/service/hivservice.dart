import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static List<String>? getirIndeksler() {
    var box = Hive.box("vkiveriler");
    List<String> kayitliIndeksler = [];
    if (box.length == 0) {
      kayitliIndeksler.add("25");
      return kayitliIndeksler;
    } else {
      for (int i = 0; i < box.length; i++) {
        debugPrint(box.get(i).toString());
        kayitliIndeksler.add((box.getAt(i)).toString());
        debugPrint(kayitliIndeksler.toString());
      }
      return kayitliIndeksler;
    }
  }
}
