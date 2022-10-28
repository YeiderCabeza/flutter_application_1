import 'package:flutter/material.dart';
import '../Widgets/Registro.dart';
import '../Widgets/ListUsuarios.dart';
import '../Widgets/RegistroDs.dart';
import '../Widgets/editar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'CRUD', initialRoute: '/frmRegistroDS', routes: {
      '/frmRegistro': (context) => const Registro(),
      '/listado': (context) => const ListUsuarios(),
      '/frmRegistroDS': (context) => const frmRegistroDS(),
      '/Editar': (context) => const EditarUsuario(),
    });
  }
}
