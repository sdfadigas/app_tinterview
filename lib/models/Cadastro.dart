abstract class ValidadorCampos {
  bool validarNome(String nome);
  bool validarEmail(String email);
  bool validarSenha(String senha);
}

class ValidadorCamposPadrao implements ValidadorCampos {
  @override
  bool validarNome(String nome) {
    return nome.isNotEmpty;
  }

  @override
  bool validarEmail(String email) {
    return email.isNotEmpty && email.contains("@");
  }

  @override
  bool validarSenha(String senha) {
    return senha.length >= 5;
  }
}


