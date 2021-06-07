import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rh_proyect/routes/routes.dart';
import 'package:rh_proyect/src/database/models/forms.dart';
import 'package:rh_proyect/src/database/models/user.dart';
import 'package:rh_proyect/src/pages/unknow/unkown_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(FormsAdapter());
  var box = await Hive.openBox<User>('users');
  var user = User()
    ..username = '1'
    ..email = 'test@test.com'
    ..password = '1234'
    ..active = true;
  box.add(user);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.theme.copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          elevation: 8.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            headline6: GoogleFonts.lato(),
          ),
        ),
      ),
      initialRoute: '/reclutamiento',
      unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      getPages: getPages(),
    );
  }
}
