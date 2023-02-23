import 'package:sqflite/sqflite.dart';

import '../../model/aluno.dart';
import '../db_config.dart';

class AlunoDao {
  static const String table = 'CREATE TABLE $_tableName('
      '$_nome TEXT, '
      '$_dataNascimento TEXT,'
      '$_celular TEXT,'
      '$_classe TEXT,'
      '$_batizado TEXT,'
      '$_dataBatizado TEXT,'
      '$_dataCadastro TEXT,'
      '$_sexo TEXT)';

  static const String _tableName = 'alunos';
  static const String _nome = 'nome';
  static const String _dataNascimento = 'data_nascimento';
  static const String _celular = 'celular';
  static const String _classe = 'classe';
  static const String _batizado = 'batizado';
  static const String _dataBatizado = 'data_batizado';
  static const String _dataCadastro = 'data_cadastro';
  static const String _sexo = 'sexo';

  Future<int> save(Aluno aluno) async {
    final Database db = await getDatabase();
    Map<String, dynamic> alunoMap = _toMap(aluno);
    return db.insert(_tableName, alunoMap);
  }

  Future<List<Aluno>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Aluno> alunos = _toList(result);
    return alunos;
  }

  Map<String, dynamic> _toMap(Aluno aluno) {
    final Map<String, dynamic> alunoMap = {};
    alunoMap[_nome] = aluno.nome;
    alunoMap[_dataNascimento] = aluno.dataNascimento;
    alunoMap[_celular] = aluno.celular;
    alunoMap[_classe] = aluno.classe;
    alunoMap[_batizado] = aluno.batizado;
    alunoMap[_dataBatizado] = aluno.dataBatizado;
    alunoMap[_dataCadastro] = aluno.dataCadastro;
    alunoMap[_sexo] = aluno.sexo;
    return alunoMap;
  }

  List<Aluno> _toList(List<Map<String, dynamic>> result) {
    final List<Aluno> alunos = [];
    for (Map<String, dynamic> row in result) {
      final Aluno aluno = Aluno(
        row[_nome],
        row[_dataNascimento],
        row[_celular],
        row[_classe],
        row[_batizado],
        row[_dataBatizado],
        row[_dataCadastro],
        row[_sexo],
      );
      alunos.add(aluno);
    }
    return alunos;
  }

  Future<int> update(Aluno aluno) async {
    final Database db = await getDatabase();
    Map<String, dynamic> studentMap = _toMap(aluno);
    return db.update(
      _tableName,
      studentMap,
      where: '$_nome = ?',
      whereArgs: [aluno.nome],
    );
  }

  Future<int?> count() async {
    final Database db = await getDatabase();
    return Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM $_tableName'),
    );
  }

  Future<int> delete(String nome) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: '$_nome = ?',
      whereArgs: [nome],
    );
  }

  Future<int> deleteAll() async {
    final Database db = await getDatabase();
    return db.delete(_tableName);
  }

  // drop and recreate alunos
  Future<void> recreate() async {
    final Database db = await getDatabase();
    await db.execute('DROP TABLE IF EXISTS $_tableName');
    await db.execute(table);
  }
  
}