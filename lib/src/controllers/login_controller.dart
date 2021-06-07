import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:rh_proyect/src/database/models/user.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var username = ''.obs;
  var password = ''.obs;

  var isvalidemail = false.obs;
  var isvalidusername = false.obs;
  var isvalidpassword = false.obs;

  String getEmail(String text) {
    if (text == '' || text.isEmpty) {
      isvalidemail.value = false;
      return email.value = 'Ponga su correo';
    }
    if (text.contains('@')) {
      email.value = text;
      isvalidemail.value = true;
      return null;
    } else {
      isvalidemail.value = false;
      return email.value = 'Ponga un correo electrónico valido';
    }
  }

  String getUserName(String text) {
    if (text == '' || text.isEmpty) {
      isvalidusername.value = false;
      return username.value = 'Ponga su nombre de usuario';
    }
    if (text.contains('1')) {
      username.value = text;
      isvalidusername.value = true;
      return null;
    } else {
      isvalidusername.value = false;
      return username.value = 'Ponga un nombre de usuario valido';
    }
  }

  String getPassword(String text) {
    if (text == '' || text.isEmpty) {
      isvalidpassword.value = false;
      return password.value = 'Ponga su contraseña';
    }
    if (text.length >= 4) {
      password.value = text;
      isvalidpassword.value = true;
      return null;
    } else {
      isvalidpassword.value = false;
      return password.value = 'Ponga una contraseña de más de 3 caracteres';
    }
  }

  Future<bool> validForm() async {
    var box = Hive.box<User>('users');
    if (username.value == box.get(0).username &&
        email.value == box.get(0).email &&
        password.value == box.get(0).password) return true;
    return false;
  }
}
