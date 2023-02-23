String? dateChecker(String? date) {
  if (date == null ||
      date.isEmpty ||
      date.trim() == '/' ||
      date.trim() == '//') {
    return 'Por favor, informe a data';
  }
  final RegExp nameExp = RegExp(
      r'^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$');
  if (!nameExp.hasMatch(date)) {
    return 'Por favor, informe uma data válida';
  }
  if (checkYear(date) != null) {
    return checkYear(date);
  }
  return null;
}

String? checkYear(String? date) {
  final String ano = date!.substring(6, 10);
  final int anoInt = int.parse(ano);
  final int anoAtual = DateTime.now().year;
  if (anoInt > anoAtual) {
    return 'Por favor, corrija o ano';
  }
  return null;
}
