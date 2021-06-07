import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBox {
  
  Future<Box> openBox({String boxname = 'testBox'}) async {
    return await Hive.openBox(boxname);
  }

  Future<void> putBox(Box box, {String key, String value}) async {
    return await box.put(key, value);
  }
}
