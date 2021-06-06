import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rh_proyect/src/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFFFF670A),
          elevation: 0.0,
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 18,
              fontFamily: 'Calibri',
              color: Colors.white,
            ),
          ),
        ),
      ),
      child: ScaffoldApp(),
    );
  }
}

class ScaffoldApp extends StatelessWidget {
  final LoginController lc = Get.put(LoginController());
  final double _maxWith = 100;
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imageHeader(),
            _form(),
          ],
        ),
      ),
    );
  }

  Widget _imageHeader() => Center(child: Image.asset('images/Logo-Small.png'));


  Widget _form() => Form(
        key: _formState,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 600,
            minWidth: 100,
            minHeight: 1.0,
          ),
          child: Column(
            children: [
              _textTitle('NOMBRE DE USUARIO'),
              _textFormUserName(),
              _textTitle('CORREO'),
              _textFormEmail(),
              _textTitle('CONTRASEÑA'),
              _textFormPassword(),
              _validateFormButton(),
            ],
          ),
        ),
      );

  Widget _textTitle(String text) => Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(top: 10.0, left: 10.0),
        child: Text(text, style: GoogleFonts.lato()),
      );

  Widget _textFormEmail() => Obx(
        () => LimitedBox(
          maxWidth: _maxWith,
          child: TextFormField(
            validator: lc.getEmail,
            decoration: InputDecoration(
              errorText: lc.email.value == 'Correcto' ? null : lc.email.value,
            ),
          ),
        ),
      );

  Widget _textFormUserName() => Obx(
        () => LimitedBox(
          maxWidth: _maxWith,
          child: TextFormField(
            validator: lc.getUserName,
            decoration: InputDecoration(
              errorText:
                  lc.username.value == 'Correcto' ? null : lc.username.value,
            ),
          ),
        ),
      );

  Widget _textFormPassword() => Obx(
        () => LimitedBox(
          maxWidth: _maxWith,
          child: TextFormField(
            validator: lc.getPassword,
            decoration: InputDecoration(
              errorText:
                  lc.password.value == 'Correcto' ? null : lc.password.value,
            ),
          ),
        ),
      );

  Widget _validateFormButton() => TextButton(
        onPressed: onPressed,
        child: Container(
          child: Text('ENTRAR'),
        ),
      );

  void onPressed() {
    if (_formState.currentState.validate()) {
      if (lc.validForm()) {
        Get.snackbar('Procesando', 'Proceso Correcto');
        Get.toNamed('/reclutamiento');
      } else
        Get.snackbar('Procesando', 'Error de proceso');
    } else
      Get.snackbar('Procesando', 'Error de proceso');
  }
}
