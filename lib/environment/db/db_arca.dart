import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:proyecto_veterinaria_arca/models/Mascota.dart';

import 'package:sqflite/sqflite.dart';

class DBArca {
  Database? _ArcaDataBase;

  static final DBArca db = DBArca._();

  DBArca._();

  Future<Database?> getDatabase() async {
    if (_ArcaDataBase != null) return _ArcaDataBase;
    _ArcaDataBase = await initDB();
    return _ArcaDataBase;
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "ArcaDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE MASCOTA("
            "IdMascota TEXT PRIMARY KEY, "
            "Descripcion TEXT, "
            "IdCategoria TEXT, "
            "Edad TEXT, "
            "Imagen1 TEXT, "
            "Estado TEXT, "
            "Activo TEXT, "
            "Flag TEXT, "
            "IdColor TEXT, "
            "IdRaza TEXT, "
            "Genero TEXT, "
            "Vacunas TEXT, "
            "Tamanio TEXT, "
            "Esterelizado TEXT, "
            "Imagen2 TEXT, "
            "Imagen3 TEXT, "
            "Categoria TEXT, "
            "Color TEXT, "
            "Raza TEXT, "
            "Favorito TEXT);");
      },
    );
  }

  //Listar Mascotas
  Future<List> getMascotasRaw() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res =
        await db!.rawQuery("SELECT * FROM MASCOTA");
    return res;
  }

  Future<List<MascotaModel>> getMascotas() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res = await db!.query("MASCOTA");
    List<MascotaModel> mascotas =
        res.map<MascotaModel>((item) => MascotaModel.fromJson(item)).toList();
    return mascotas;
  }

  Future<List<MascotaModel>> getMascotasActivos() async {
    final db = await getDatabase();
      List<Map<String, dynamic>> res = await db!.query("MASCOTA",  where: "Activo = 1 and Estado = 1");
    List<MascotaModel> mascotas =
        res.map<MascotaModel>((item) => MascotaModel.fromJson(item)).toList();
    return mascotas;
  }

  Future<List<MascotaModel>> getMascotaRazaCategoria(
      String raza, String categoria) async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res = await db!
        .query("MASCOTA", where: "IdRaza = $raza and IdCategoria = $categoria");
    List<MascotaModel> mascotas =
        res.map<MascotaModel>((item) => MascotaModel.fromJson(item)).toList();
    return mascotas;
  }

  Future<List<MascotaModel>> getMascotaRaza(String raza) async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res =
        await db!.query("MASCOTA", where: "IdRaza = $raza");
    List<MascotaModel> mascotas =
        res.map<MascotaModel>((item) => MascotaModel.fromJson(item)).toList();
    return mascotas;
  }

  Future<List<MascotaModel>> getMascotaCategoria(String categoria) async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res =
        await db!.query("MASCOTA", where: "IdCategoria = $categoria");
    List<MascotaModel> mascotas =
        res.map<MascotaModel>((item) => MascotaModel.fromJson(item)).toList();
    return mascotas;
  }

  Future<List<MascotaModel>> getMascotaFavourites() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res =
        await db!.query("MASCOTA", where: "Favorito = 'true'");
    List<MascotaModel> mascotas =
        res.map<MascotaModel>((item) => MascotaModel.fromJson(item)).toList();
    return mascotas;
  }

  //Insertar Eventos

  Future<int> insertAllMascotaRaw(MascotaModel mascotaModel) async {
    final db = await getDatabase();
    int res = await db!.rawInsert(
        "INSERT INTO MASCOTA(IdMascota, Descripcion, IdCategoria, Edad,"
        " Imagen1, Estado, Activo, Flag, IdColor, IdRaza,"
        "Genero, Vacunas, Tamanio, Esterelizado, Imagen2, Imagen3, Categoria, "
        "Color, Raza) VALUES "
        "('${mascotaModel.idMascota}','${mascotaModel.descripcion}', '${mascotaModel.idCategoria}', "
        "'${mascotaModel.edad}','${mascotaModel.imagen1}', '${mascotaModel.estado}',"
        "'${mascotaModel.activo}','${mascotaModel.flag}','${mascotaModel.idColor}',"
        "'${mascotaModel.idRaza}','${mascotaModel.genero}','${mascotaModel.vacunas}',"
        "'${mascotaModel.tamanio}', '${mascotaModel.esterelizado}', '${mascotaModel.imagen2}', "
        "'${mascotaModel.imagen3}', '${mascotaModel.categoria}', '${mascotaModel.color}', "
        "'${mascotaModel.raza}')");
    //"'${eventoModel.precioGeneral}', '${eventoModel.precioVip}','${eventoModel.precioBox}')");
    return res;
  }

  Future<int> insertBook(MascotaModel mascotaModel) async {
    final db = await getDatabase();
    int res = await db!.insert(
      "MASCOTA",
      mascotaModel.toJson(),
    );
    return res;
  }

  Future<int> updateMascota(MascotaModel mascotaModel) async {
    final db = await getDatabase();
    var row = {
      'IdMascota': mascotaModel.idMascota,
      'IdCategoria': mascotaModel.idCategoria,
      'Descripcion': mascotaModel.descripcion,
      'Edad': mascotaModel.edad,
      'Imagen1': mascotaModel.imagen1,
      'Estado': mascotaModel.estado,
      'Activo': mascotaModel.activo,
      'Flag': mascotaModel.flag,
      'IdColor': mascotaModel.idColor,
      'IdRaza': mascotaModel.idRaza,
      'Genero': mascotaModel.genero,
      'Vacunas': mascotaModel.vacunas,
      'Tamanio': mascotaModel.tamanio,
      'Esterelizado': mascotaModel.esterelizado,
      'Imagen2': mascotaModel.imagen2,
      'Imagen3': mascotaModel.imagen3,
      'Categoria': mascotaModel.categoria,
      'Color': mascotaModel.color,
      'Raza': mascotaModel.raza,
    };

    int updateCount = await db!.update("MASCOTA", row,
        where: 'IdMascota = ?', whereArgs: [mascotaModel.idMascota]);

    return updateCount;
  }

  Future<int> updateIsNotFavouriteMascota(String? id) async {
    final db = await getDatabase();
    int result = await db!.update(
      'MASCOTA',
      {'Favorito': 'false'},
      where: "IdMascota = ?",
      whereArgs: [id],
    );
    return result;
  }

  Future<int> updateIsFavouriteMascota(String? id) async {
    final db = await getDatabase();
    int result = await db!.update(
      'MASCOTA',
      {'Favorito': 'true'},
      where: "IdMascota = ?",
      whereArgs: [id],
    );
    return result;
  }

  Future<int> deleteMascota(String? id) async {
    final db = await getDatabase();
    int result = await db!.delete(
      'MASCOTA',
      where: "IdMascota = ?",
      whereArgs: [id],
    );
    return result;
  }

//INSERTAR NOTIFICACIONES

}
