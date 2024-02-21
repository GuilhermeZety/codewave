class InputValidations {
  static String? simpleInputValidation(String? value, {int? length}) {
    if (value == null || value.isEmpty) {
      return 'Preencha este campo';
    }
    if (length != null) {
      if (value.length < length) {
        return 'Insira pelo menos $length caracteres';
      }
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Insira o Email do usuário';
    }
    if (value.length < 10) {
      return 'Insira todo o Email';
    }
    if (value.contains('@') && value.contains('.com')) {
      return null;
    }
    return 'Email inválido';
  }
}
