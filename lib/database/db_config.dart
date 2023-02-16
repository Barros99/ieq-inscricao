import 'package:ieq_sub/database/dao/aluno_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'alunos.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(AlunoDao.table);
  }, version: 1);
}
