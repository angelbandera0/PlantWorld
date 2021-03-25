import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseClient {
  Database _db;

  Future<Database> create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, "tuconsumo.db");

    return _db = await openDatabase(dbPath, version: 1, onCreate: this._create);
  }

  Future _create(Database db, int version) async {
    await db.execute(
      "CREATE TABLE registro(id INTEGER PRIMARY KEY autoincrement, alias TEXT, serial TEXT, contador TEXT, folio TEXT, ruta TEXT, oficina TEXT)",
    );
    await db.execute(
      "CREATE TABLE factura(id INTEGER PRIMARY KEY autoincrement, id_registro INTEGER, lectura INTEGER, consumo INTEGER, credito DOUBLE, saldo DOUBLE, importe DOUBLE, dia INTEGER, mes INTEGER, anno INTEGER, FOREIGN KEY (id_registro) REFERENCES factura (id) ON DELETE CASCADE ON UPDATE NO ACTION)",
    );
  }
}

/*Future<Database> getDataBase() async {
  Directory path = await getApplicationDocumentsDirectory();
  String dbPath = join(path.path, "tuconsumo.db");

  final Future<Database> database = openDatabase(
    // Establece la ruta a la base de datos.
    dbPath,
    // Cuando la base de datos se crea por primera vez, crea las tablas de almacenamiento
    onCreate: (db, version) async {
      // Ejecuta la sentencia CREATE TABLE en la base de datos
      await db.execute(
        "CREATE TABLE registro(id INTEGER PRIMARY KEY AUTO INCREMENT, alias TEXT, serial TEXT, contador TEXT, folio TEXT, ruta TEXT, oficina TEXT)",
      );
      await db.execute(
        "CREATE TABLE factura(id INTEGER PRIMARY KEY AUTO INCREMENT, id_registro INTEGER, lectura INTEGER, consumo INTEGER, credito DOUBLE, saldo DOUBLE, importe DOUBLE, FOREIGN KEY (id_registro) REFERENCES factura (id) ON DELETE CASCADE ON UPDATE NO ACTION)",
      );
    },
    // Establece la versión. Esto ejecuta la función onCreate y proporciona una
    // ruta para realizar actualizacones y defradaciones en la base de datos.
    version: 1,
  );

  return database;
}*/
