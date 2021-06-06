import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rh_proyect/routes/routes.dart';
import 'package:rh_proyect/src/pages/unknow/unkown_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.theme.copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          elevation: 8.0,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
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
