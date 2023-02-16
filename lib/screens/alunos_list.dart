import 'package:flutter/material.dart';
import 'package:ieq_sub/database/dao/aluno_dao.dart';
import 'package:ieq_sub/model/aluno.dart';

class AlunosList extends StatefulWidget {
  const AlunosList({super.key});

  @override
  State<AlunosList> createState() => _AlunosListState();
}

class _AlunosListState extends State<AlunosList> {
  final AlunoDao _dao = AlunoDao();
  final List<Aluno> _alunos = [];

  @override
  void initState() {
    super.initState();
    _dao.findAll().then((alunos) => setState(() => _alunos.addAll(alunos)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos cadastrados'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Aluno aluno = _alunos[index];
          return _AlunoItem(aluno);
        },
        itemCount: _alunos.length,
      ),
    );
  }
}

class _AlunoItem extends StatelessWidget {
  final Aluno aluno;

  const _AlunoItem(this.aluno);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(aluno.nome),
        subtitle: Text(aluno.dataNascimento),
      ),
    );
  }
}
