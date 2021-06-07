import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rh_proyect/src/controllers/login_controller.dart';
import 'package:rh_proyect/src/pages/reclutamiento/formulario_page.dart';

class ReclutamientoPage extends StatelessWidget {
  static const String route = '/reclutamiento';

  @override
  Widget build(BuildContext context) {
    final lc = Get.find<LoginController>().isBlank
        ? Get.put<LoginController>(LoginController())
        : Get.find<LoginController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('RECLUTAMIENTO GRUPO ORTIZ'),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () async {
              GetStorage().write('active', false);
              Get.offAllNamed('/');
              lc.onClose();
            },
            icon: Icon(Icons.exit_to_app),
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'CERRAR SESIÓN',
              ),
            ),
          )
        ],
      ),
      body: FirtView(),
    );
  }
}

class FirtView extends StatelessWidget {
  final List _list = [
    [1, 'ANDRES', 'HERNANDEZ', '181198'],
    [2, 'ANDRES', 'HERNANDEZ', '181198'],
    [3, 'ANDRES', 'HERNANDEZ', '181198'],
    [4, 'ANDRES', 'HERNANDEZ', '181198'],
    [5, 'ANDRES', 'HERNANDEZ', '181198'],
    [6, 'ANDRES', 'HERNANDEZ', '181198'],
    [7, 'ANDRES', 'HERNANDEZ', '181198'],
    [8, 'ANDRES', 'HERNANDEZ', '181198'],
    [9, 'ANDRES', 'HERNANDEZ', '181198'],
    [10, 'ANDRES', 'HERNANDEZ', '181198'],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(32),
      children: [
        _header(),
        _body(),
        _listData(),
        _footer(),
      ],
    );
  }

  Widget _header() => Container(
        child: Row(
          children: responsive(),
        ),
      );

  List<Widget> responsive() => [
        IconButton(
          onPressed: () => Get.toNamed(FormularioPage.route),
          icon: Icon(Icons.dvr_sharp),
          tooltip: 'FORMULARIO',
        ),
      ];

  Widget _body() => Container(
        child: Column(
          children: _list
              .map((e) => ListTile(
                  leading: Text('${e[0]}'),
                  title: Text('${e[1]} ${e[2]}'),
                  trailing: Text(e[3])))
              .toList(),
        ),
      );

  Widget _listData() => Container();

  Widget _footer() => Container();
}
