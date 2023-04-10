import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  //Construtor com acesso privado
  DB._();
  //Cruar uma instancia de DB
  static final DB instancia = DB._();
  //Instancia do SQLite
  static Database? _database;

  get database async{
    if(_database != null){
      return _database;
    }
    else{
      return await _initDatabase();
    }
  }

  _initDatabase() async {
  return await openDatabase(
    join(await getDatabasesPath())
  );
}

}

