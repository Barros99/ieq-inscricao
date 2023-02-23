// primeira infância de 0 - 6 anos(72 meses)
// criança 0 - 11 anos
// adolescente 12 - 17 anos
// jovem 18 - 29 anos
// adulto 30 - 59 anos
// idoso 60

enum Classe { crianca, adolescente, jovem, homens, mulheres }

class ClasseHelper {
  final String sexo;
  final String dataNascimento;

  ClasseHelper(this.sexo, this.dataNascimento);

  Object get classe {
    final int idade =
        DateTime.now().year - int.parse(dataNascimento.substring(6, 10));
    if (idade < 12) {
      return Classe.crianca;
    } else if (idade >= 12 && idade < 18) {
      return Classe.adolescente;
    } else if (idade >= 18 && idade < 30) {
      return Classe.jovem;
    } else if (idade >= 30) {
      return sexo == 'Gender.Male' ? Classe.homens : Classe.mulheres;
    } else {
      return 'Não foi possível determinar a classe';
    }
  }
}
