import 'package:flutter/material.dart';
import 'package:ieg_sub/database/db_config.dart';
import 'model/aluno.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nome = TextEditingController();
  final dataNascimento = TextEditingController();
  final celular = TextEditingController();
  final classe = TextEditingController();
  final batizado = TextEditingController();
  final dataBatizado = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nome.dispose();
    dataNascimento.dispose();
    celular.dispose();
    classe.dispose();
    batizado.dispose();
    dataBatizado.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ESCOLA BÍBLICA - 2023 - INSCRIÇÃO'),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: nome,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Nome'),
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                controller: dataNascimento,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Data de Nascimento',
                ),
              ),
              TextFormField(
                controller: celular,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Celular',
                ),
              ),
              TextFormField(
                controller: classe,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Classe',
                ),
              ),
              TextFormField(
                controller: batizado,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Batizado',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                controller: dataBatizado,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Data de Batismo',
                ),
              ),
              const RadioWidgetStateful(),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          save(Aluno(
                  nome.text,
                  dataNascimento.text,
                  celular.text,
                  classe.text,
                  batizado.text,
                  dataBatizado.text,
                  DateTime.now().toIso8601String()))
              .then((value) =>
                  findAll().then((value) => debugPrint(value.toString())));
        },
        tooltip: 'Save',
        child: const Icon(Icons.add),
      ),
    );
  }
}

enum IsBatizado { sim, nao }

class RadioWidgetStateful extends StatefulWidget {
  const RadioWidgetStateful({super.key});

  @override
  State<RadioWidgetStateful> createState() => _RadioWidgetStateful();
}

class _RadioWidgetStateful extends State<RadioWidgetStateful> {
  IsBatizado? _option = IsBatizado.sim;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Sim'),
          leading: Radio<IsBatizado>(
            value: IsBatizado.sim,
            groupValue: _option,
            onChanged: (IsBatizado? value) {
              setState(() {
                _option = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Não'),
          leading: Radio<IsBatizado>(
            value: IsBatizado.nao,
            groupValue: _option,
            onChanged: (IsBatizado? value) {
              setState(() {
                _option = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
