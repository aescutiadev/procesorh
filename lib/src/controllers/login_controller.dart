import 'package:get/get.dart';

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
    if (text.contains('0')) {
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
    if (text.length >= 6) {
      password.value = text;
      isvalidpassword.value = true;
      return null;
    } else {
      isvalidpassword.value = false;
      return password.value = 'Ponga una contraseña de más de 6 caracteres';
    }
  }

  bool validForm() {
    if (isvalidemail.value && isvalidusername.value && isvalidpassword.value)
      return true;
    return false;
  }
}
