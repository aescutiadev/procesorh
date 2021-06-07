import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:rh_proyect/src/database/models/user.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var username = ''.obs;
  var password = ''.obs;

  String getEmail(String text) {
    if (text == '' || text.isEmpty) {
      return email.value = 'Ponga su correo';
    }
    if (text.contains('@')) {
      email.value = text;
      return null;
    } else {
      return email.value = 'Ponga un correo electrónico valido';
    }
  }

  String getUserName(String text) {
    if (text == '' || text.isEmpty) {
      return username.value = 'Ponga su nombre de usuario';
    }
    if (text.contains('1')) {
      username.value = text;
      return null;
    } else {
      return username.value = 'Ponga un nombre de usuario valido';
    }
  }

  String getPassword(String text) {
    if (text == '' || text.isEmpty) {
      return password.value = 'Ponga su contraseña';
    }
    if (text.length >= 4) {
      password.value = text;
      return null;
    } else {
      return password.value = 'Ponga una contraseña de más de 3 caracteres';
    }
  }

  Future<bool> validForm() async {
    try {
      var box = Hive.box<User>('users');
      if (username.value == box.get(0).username &&
          email.value == box.get(0).email &&
          password.value == box.get(0).password) {
        GetStorage().write('active', true);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
