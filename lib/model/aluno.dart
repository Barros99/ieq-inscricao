class Aluno {
  final String nome;
  final String dataNascimento;
  final String celular;
  final String classe;
  final String batizado;
  final String dataBatizado;
  final String dataCadastro;
  final String sexo;

  Aluno(this.nome, this.dataNascimento, this.celular, this.classe,
      this.batizado, this.dataBatizado, this.dataCadastro, this.sexo);

  @override
  String toString() {
    return '{ nome: $nome, dataNascimento: $dataNascimento, celular: $celular, classe: $classe, batizado: $batizado, dataBatizado: $dataBatizado, dataCadastro: $dataCadastro, sexo: $sexo }\n';
  }
}
