import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class TransaccionesBD {
  static Future<void> CrearTabla(Database database) async {
    await database.execute(""" CREATE TABLE Usuarios(
      Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      Nombre TEXT NOT NULL,
      Apellido TEXT NOT NULL,
      Correo TEXT NOT NULL,
      Password TEXT NOT NULL,
      FechaRegistro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
  """);
  }

  static Future<Database> DB() async {
    return openDatabase('mibd.db', version: 1,
        onCreate: (Database database, int version) async {
      await CrearTabla(database);
    });
  }

  static Future<int> RegUsuario(
      String nombre, String apellido, String correo, String password) async {
    final c = await DB();
    final datos = {
      'Nombre': nombre,
      'Apeliido': apellido,
      'Correo': correo,
      'Password': password
    };

    final id = await c.insert('Usuarios', datos);
    return id;
  }

  static Future<int> EditUsuario(
      int id, String nombre, String apellido, String correo) async {
    final c = await DB();
    final datos = {'Nombre': nombre, 'Apeliido': apellido, 'Correo': correo};

    final r =
        await c.update('Usuarios', datos, where: "Id = ?", whereArgs: [id]);
    return r;
  }

  // static Future<int> TotalRegistros()async{
  //      final c = await DB();
  //      var id    = await c.rawQuery("SELECT COUNT(*) FROM usuarios");
  //      int r = id.length;
  //      return r;
  //   }

//Lista todos los usuario
  static Future<List<Map<String, dynamic>>> getUsusarios() async {
    final c = await DB();
    return c.query("Usuarios", orderBy: "Id");
  }

  //RETONA EL USUARIO CON EL ID
  static Future<List<Map<String, dynamic>>> getUsusario(int id) async {
    final c = await DB();
    return c.query("Usuarios", where: "Id = ?", whereArgs: [id], limit: 1);
  }

  static Future<void> eliminarUsuario(int id) async {
    final c = await DB();
    try {
      await c.delete("Usuarios", where: "Id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Error, no se pudo eliminar");
    }
  }
}
