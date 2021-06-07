import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownController extends GetxController {
  String selectedValue;

  var language = <String>['English', 'Español'];

  void onSelected(String value) {
    selectedValue = value ?? '';
  }
}

class FormularioPage extends StatelessWidget {
  static const String route = '/reclutamiento/newform';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FORMULARIO'),
      ),
      body: FirstForm(),
    );
  }
}

class FirstForm extends StatelessWidget {
  final List<String> _options = [
    'ISA',
    'AREXA',
    'QUANTUM',
    'BRUCKNER',
    'SAPIESA LEON',
    'SAPIESA SUCURSAL',
    'SAPIESA MATRIZ',
    'TRENZADOS MARINOS MATRIZ',
    'TRENZADOS MARINOS SUCURSAL',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: Colors.grey.shade400),
        _form(),
      ],
    );
  }

  Widget _form() => SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                constraints: BoxConstraints(maxWidth: 500.0, minWidth: 200.0),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        _titleSection('DATOS GENERALES'),
                        _dropdownMenu(),
                        _tffPlanta('Puesto'),
                        _tffPlanta('Nombre'),
                        _tffPlanta('Apellido Paterno'),
                        _tffPlanta('Apellido Materno'),
                        _tffPlanta('Edad'),
                        _tffPlanta('Domicilio'),
                        _tffPlanta('Vive con'),
                        _tffPlanta('¿Cuantos hijos tiene?'),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                constraints: BoxConstraints(maxWidth: 500.0, minWidth: 200.0),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        _titleSection('PREGUNTAS GENERALES'),
                        _tffPlanta('¿Cómo se enteró de la vacante?'),
                        _tffPlanta('¿Cómo?'),
                        _tffPlanta('¿Cúando?'),
                        _tffPlanta('¿Dónde?'),
                        _tffPlanta('¿Por qué?'),
                        _tffPlanta('¿Para qué?'),
                        _tffPlanta('¿Entonces?'),
                        _tffPlanta('¿Tal vez?'),
                        _tffPlanta('¿No sé?'),
                        _tffPlanta('¿Relleno?'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _titleSection(String title) => Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.centerLeft,
        height: 50.0,
        color: Colors.orange.shade700,
        child: Text(
          title,
          style: GoogleFonts.lato(color: Colors.white),
        ),
      );

  Widget _tffPlanta(String title, {Function(String) onpressed}) => ListTile(
        title: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            title,
            style: GoogleFonts.lato(),
          ),
        ),
        subtitle: Container(
          padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          child: TextFormField(
            onChanged: onpressed,
            style: TextStyle(fontSize: 14.0),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.amberAccent,
                  style: BorderStyle.solid,
                  width: 0.8,
                ),
              ),
              // fillColor: Colors.grey.shade300,
              // filled: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              fillColor: Colors.white,
              hoverColor: Colors.grey.shade200,
              filled: true,
            ),
          ),
        ),
      );

  Widget _dropdownMenu() => ListTile(
        title: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'PLANTA',
            style: GoogleFonts.lato(),
          ),
        ),
        subtitle: Container(
          padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          child: DropdownSearch<String>(
            mode: Mode.MENU,
            items: _options,
            hint: "Seleccionar",
            onChanged: print,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value.isEmpty ? 'Opción obligatoria' : null,
          ),
        ),
      );
}
