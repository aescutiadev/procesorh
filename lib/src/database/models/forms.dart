import 'package:hive/hive.dart';

part 'forms.g.dart';

@HiveType(typeId: 1)
class Forms extends HiveObject {
  @HiveField(0)
  String id;
  // Hive fields go here
  @HiveField(1)
  String tiemstamp;
  @HiveField(2, defaultValue: '')
  String planta;
  @HiveField(3, defaultValue: '')
  String puesto;
  @HiveField(4, defaultValue: '')
  String nombre;
  @HiveField(5, defaultValue: '')
  String app;
  @HiveField(6, defaultValue: '')
  String apm;
  @HiveField(7)
  int edad;
  @HiveField(8, defaultValue: '')
  String domicilio;
  @HiveField(9, defaultValue: '')
  String vivecon;
  @HiveField(10, defaultValue: false)
  bool tienehijos;
  @HiveField(11, defaultValue: 0)
  int numhijos = 0;
}
