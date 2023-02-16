// create a class  form to add a new aluno

import 'package:flutter/material.dart';

import '../database/dao/aluno_dao.dart';
import '../model/aluno.dart';

class AlunoForm extends StatefulWidget {
  const AlunoForm({super.key});

  @override
  State<AlunoForm> createState() => AlunoFormState();
}

class AlunoFormState extends State<AlunoForm> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _classeController = TextEditingController();
  final TextEditingController _batizadoController = TextEditingController();
  final TextEditingController _dataBatizadoController = TextEditingController();

  final AlunoDao _dao = AlunoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Alunos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _dataNascimentoController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento',
                ),
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _celularController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Celular',
                ),
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _classeController,
                decoration: const InputDecoration(
                  labelText: 'Classe',
                ),
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _batizadoController,
                decoration: const InputDecoration(
                  labelText: 'Batizado',
                ),
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _dataBatizadoController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: 'Data do Batismo',
                ),
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final String nome = _nomeController.text;
                final String dataNascimento = _dataNascimentoController.text;
                final String celular = _celularController.text;
                final String classe = _classeController.text;
                final String batizado = _batizadoController.text;
                final String dataBatizado = _dataBatizadoController.text;

                final Aluno alunoNovo = Aluno(
                  nome,
                  dataNascimento,
                  celular,
                  classe,
                  batizado,
                  dataBatizado,
                  DateTime.now().toString(),
                );
                _dao.save(alunoNovo).then((id) => Navigator.pop(context));
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
