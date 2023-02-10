import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerDataNascimento = TextEditingController();
  final TextEditingController _controllerCelular = TextEditingController();
  final TextEditingController _controllerClasse = TextEditingController();


  @override
  Widget build(BuildContext context) {
    const appTitle = 'ESCOLA BÍBLICA - 2023 - INSCRIÇÃO';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _controllerNome,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                controller: _controllerDataNascimento,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Data de nascimento',
                ),
              ),
              TextFormField(
                controller: _controllerCelular,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Celular',
                ),
              ),
              TextFormField(
                controller: _controllerClasse,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Classe',
                ),
              ),
              
            ]),
      ),
    );
  }
}

  /* nome
     nascimento
     celular
     classe
     batizado(boolean) data do batizado
     data
  */
