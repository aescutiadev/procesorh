import 'package:get/get.dart';
import 'package:rh_proyect/src/pages/login/login_page.dart';
import 'package:rh_proyect/src/pages/reclutamiento/formulario_page.dart';
import 'package:rh_proyect/src/pages/reclutamiento/reclutamiento_page.dart';

List<GetPage<dynamic>> getPages() => [
      GetPage(name: LoginPage.route, page: () => LoginPage()),
      GetPage(name: ReclutamientoPage.route, page: () => ReclutamientoPage()),
      GetPage(name: FormularioPage.route, page: () => FormularioPage()),
    ];
