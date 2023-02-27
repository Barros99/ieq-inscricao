import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:ieq_sub/utils/cell_br_formatter.dart';

import '../database/dao/aluno_dao.dart';
import '../utils/date_br_formatter.dart';
import '../utils/reg_ex_date.dart';
import '../utils/set_classe.dart';
import '../model/aluno.dart';

class AlunoForm extends StatefulWidget {
  const AlunoForm({super.key});

  @override
  State<AlunoForm> createState() => AlunoFormState();
}

class AlunoFormState extends State<AlunoForm> {
  final _formKey = GlobalKey<FormState>();
  var sexo = Gender.Male.toString();

  final _nomeController = TextEditingController();
  final _dataNascimentoController = TextEditingController();
  final _celularController = TextEditingController();
  final _batizadoController = TextEditingController();
  final _dataBatizadoController = TextEditingController();
  late bool _isBatizado = false;

  final AlunoDao _dao = AlunoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Alunos'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _nomeController,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Por favor, informe o nome do aluno'
                      : null,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _dataNascimentoController,
                  validator: (date) {
                    return dateChecker(date);
                  },
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [
                    DateBrFormater(mask: '##/##/####', separator: '/')
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Data de Nascimento',
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              getWidget(false, false),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _celularController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    CellBrFormater(mask: '(##) #####-####', separator: ' ')
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Celular',
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _isBatizado = value == 'Sim' ? true : false;
                    });
                  },
                  controller: _batizadoController,
                  decoration: const InputDecoration(
                    labelText: 'Batizado',
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _dataBatizadoController,
                  enabled: _isBatizado,
                  validator: _isBatizado ? (date) {
                    return dateChecker(date);
                  } : null,
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [
                    DateBrFormater(mask: '##/##/####', separator: '/')
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Data do Batismo',
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setAluno(context);
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void setAluno(BuildContext context) {
    final String nome = _nomeController.text;
    final String dataNascimento = _dataNascimentoController.text;
    final String celular = _celularController.text;
    final String batizado = _batizadoController.text;
    final String dataBatizado = _dataBatizadoController.text;
    
    ClasseHelper classeHelper =
        ClasseHelper(sexo, dataNascimento);
    final Object classeStr = classeHelper.classe;
    
    if (_formKey.currentState!.validate()) {
      final Aluno alunoNovo = Aluno(
          nome,
          dataNascimento,
          celular,
          removeClassePrefix(classeStr),
          batizado,
          dataBatizado,
          getDataAtual(),
          setSexo());
      _dao.save(alunoNovo).then((id) => Navigator.pop(context));
      debugPrint(sexo);
      debugPrint(classeStr.toString());
      debugPrint(alunoNovo.toString());
    }
  }

  String getDataAtual() => DateTime.now().toString();

  String setSexo() => sexo == 'Gender.Male' ? 'Masculino' : 'Feminino';

  String removeClassePrefix(Object classeStr) =>
      classeStr.toString().substring(7);

  Widget getWidget(bool showOtherGender, bool alignVertical) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: showOtherGender,
        verticalAlignedText: alignVertical,

        // to show what's selected on app opens, but by default it's Male
        selectedGender: Gender.Male,
        selectedGenderTextStyle: const TextStyle(
            color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (Gender? gender) {
          // debugPrint(sexo);
          sexo = gender.toString();
        },
        //Alignment between icons
        equallyAligned: true,

        animationDuration: const Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 50, //default : 40
      ),
    );
  }
}
