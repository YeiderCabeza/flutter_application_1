import 'package:flutter/material.dart';
import '../DataBase/Transacciones.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController cNombre = TextEditingController();
  TextEditingController cApellido = TextEditingController();
  TextEditingController cCorreo = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  int Respuesta = 0;

  late BuildContext cnt;
  @override
  Widget build(BuildContext context) {
    cnt = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Usuario"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Listado");
              },
              icon: const Icon(Icons.people))
        ],
      ),
      body: ListView(children: [
        CajaNombre(),
        CajaApellido(),
        CajaCorreo(),
        CajaPassword(),
        btnRegistrar()
      ]),
    );
  }

  Widget CajaNombre() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: cNombre,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Digite Nombre")),
      ),
    );
  }

  Widget CajaApellido() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: cApellido,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Digite Apellido")),
      ),
    );
  }

  Widget CajaCorreo() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: cCorreo,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Digite Correo")),
      ),
    );
  }

  Widget CajaPassword() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: cPassword,
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Digite Contraseña")),
      ),
    );
  }

  Widget btnRegistrar() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Registrar();
            });
          },
          child: const Text("Registrar"),
        ));
  }

  void Registrar() async {
    Respuesta = await TransaccionesBD.RegUsuario(
        cNombre.text, cApellido.text, cCorreo.text, cPassword.text);
    cNombre.text = "";
    cApellido.text = "";
    cCorreo.text = "";
    cPassword.text = "";
    mostrarAlerta();
  }

  mostrarAlerta() {
    Widget okBoton = TextButton(
        onPressed: () {
          Navigator.pop(cnt);
        },
        child: const Text("Aceptar"));

    AlertDialog alerta = AlertDialog(
      title: const Text("Mensaje"),
      content: const Text("Usuario Registrado"),
      actions: [
        okBoton,
      ],
    );

    showDialog(
        context: cnt,
        builder: (BuildContext context) {
          return alerta;
        });
  }
  //[ ]
}
