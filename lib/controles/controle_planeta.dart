import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modelos/planetas.dart';

class ControlePlaneta {
  static Database? _bd;

  Future<Database> get bd async {
    if (_bd != null) return _bd!;
    _bd = await _initBD('planetas.db');
    return _bd!;
  }

  Future<Database> _initBD(String localarquivo) async {
    final caminhoBD = await getDatabasesPath();
    final caminho = join(caminhoBD, localarquivo);
    return await openDatabase(caminho, version: 1, onCreate: _criarBD);
  }

  Future<void> _criarBD(Database bd, int versao) async {
    const sql = '''
    CREAT TABLE planetas (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      tamanho REAL NOT NULL,
      distancia REAL NOT NULL,
      apelido TEXT
    );
    ''';
    await bd.execute(sql);
  }

  Future<int> inserirPlaneta(Planeta planeta) async {
    final db = await bd;
    return await db.insert('Planetas', planeta.toMap());
  }
}
