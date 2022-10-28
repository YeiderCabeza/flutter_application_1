import 'package:flutter/material.dart';
import 'dart:ffi';
import '../DataBase/Transacciones.dart';

class ListUsuarios extends StatefulWidget {
  const ListUsuarios({super.key});

  @override
  State<ListUsuarios> createState() => ListUsuariosState();
}

class ListUsuariosState extends State<ListUsuarios>
    with WidgetsBindingObserver {
  TextEditingController cNombre = TextEditingController();
  TextEditingController cApellido = TextEditingController();
  TextEditingController cCorreo = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  int respuesta = 0;
  List<Map<String, dynamic>> usuarios = [];

  void listar() async {
    final u = await TransaccionesBD.getUsusarios();
    setState(() {
      usuarios = u;
    });
  }

  @override
  void initState() {
    super.initState();
    listar();
  }

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        listar();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/frmRegistro");
              },
              icon: const Icon(Icons.person_add_alt))
        ],
      ),
      body: ListView.builder(
          itemCount: usuarios.length,
          itemBuilder: (context, index) => Card(
                color: Colors.amber,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    usuarios[index]["Nombre"] +
                        " " +
                        usuarios[index]["Apeliidos"],
                    style: const TextStyle(color: Colors.red),
                  ),
                  subtitle: Text(
                    usuarios[index]["Correo"],
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/editar',
                                  arguments: {
                                    "Id": usuarios[index]["id"],
                                    "Nombre": usuarios[index]["Nombre"],
                                    "Apellido": usuarios[index]["Apellido"],
                                    "Correo": usuarios[index]["Correo"],
                                  }).then((value) {
                                setState() {}
                                ;
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              mostrarAlerta(usuarios[index]["Id"]);
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }

  void eliminar(int id) async {
    await TransaccionesBD.eliminarUsuario(id);

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Borrado sastifatoriamente')));
    listar();
  }

  mostrarAlerta(int id) {
    Widget okboton = TextButton(
        onPressed: () {
          eliminar(id);
          Navigator.pop(context);
          //listar();
        },
        child: const Text("Aceptar"));

    Widget Cancelar = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Cancelar"));

    AlertDialog alerta = AlertDialog(
      title: const Text("Confirmación"),
      content: const Text("¿Desea eliminar?"),
      actions: [okboton, Cancelar],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alerta;
        });
  }
}
