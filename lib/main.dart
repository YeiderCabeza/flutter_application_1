import 'package:flutter/material.dart';
import '../Widgets/Registro.dart';
import '../Widgets/ListUsuarios.dart';
import '../Widgets/RegistroDS.dart';
import '../Widgets/Editar.dart';
import '../Widgets/Inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'CRUD', initialRoute: '/Inicio', routes: {
      '/frmRegistro': (context) => const Registro(),
      '/listado': (context) => const ListUsuarios(),
      '/frmRegistroDS': (context) => const frmRegistroDS(),
      '/Editar': (context) => const EditarUsuario(),
      '/Inicio': (context) => const Principal(),
    });
  }
}
