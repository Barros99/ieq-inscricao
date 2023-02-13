import 'package:sqflite/sqflite.dart';

import '../model/aluno.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = '$dbPath/escola_biblica.db';
    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute('CREATE TABLE alunos(nome TEXT,'
          'data_nascimento TEXT,'
          'celular TEXT,'
          'classe TEXT,'
          'batizado TEXT,'
          'data_batizado TEXT,'
          'data_cadastro TEXT)');
    });
  });
}

Future<int> save(Aluno aluno) {
  return createDatabase().then((db) {
    final Map<String, dynamic> alunoMap = {};
    alunoMap['nome'] = aluno.nome;
    alunoMap['data_nascimento'] = aluno.dataNascimento;
    alunoMap['celular'] = aluno.celular;
    alunoMap['classe'] = aluno.classe;
    alunoMap['batizado'] = aluno.batizado;
    alunoMap['data_batizado'] = aluno.dataBatizado;
    alunoMap['data_cadastro'] = aluno.dataCadastro;
    return db.insert('alunos', alunoMap);
  });
}

Future<List<Aluno>> findAll() {
  return createDatabase().then((db) {
    return db.query('alunos').then((maps) {
      final List<Aluno> alunos = [];
      for (Map<String, dynamic> map in maps) {
        final Aluno aluno = Aluno(
          map['nome'],
          map['data_nascimento'],
          map['celular'],
          map['classe'],
          map['batizado'],
          map['data_batizado'],
          map['data_cadastro'],
        );
        alunos.add(aluno);
      }
      return alunos;
    });
  });
}
