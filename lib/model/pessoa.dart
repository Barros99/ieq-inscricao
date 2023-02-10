class Pessoa {
  String nome;
  DateTime dataNascimento;
  String celular;
  String classe;
  bool batizado;
  DateTime dataBatizado;
  DateTime dataCadastro = DateTime.now();
  Pessoa(this.nome, this.dataNascimento, this.celular, this.classe,
      this.batizado, this.dataBatizado, this.dataCadastro);
}

@override
String toString() {
  return 'Pessoa{nome: $nome, dataNascimento: $dataNascimento, celular: $celular, classe: $classe, batizado: $batizado, dataBatizado: $dataBatizado, dataCadastro: $dataCadastro}';
}
