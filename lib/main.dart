/* enum IsBatizado { sim, nao }

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
} */

import 'package:ieq_sub/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 27, 94, 94),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.blueAccent[700]),
      ),
      home: const Dashboard(),
    );
  }
}
