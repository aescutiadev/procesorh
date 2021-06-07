import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String username;
  // Hive fields go here
  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  @HiveField(3)
  bool active;
}
