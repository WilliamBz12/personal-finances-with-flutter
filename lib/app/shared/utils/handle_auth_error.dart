import 'package:personal_finances/app/shared/errors/auth_errors.dart';

class HandleAuthError {
  static String getStaticErrorResult(String status) {
    return _errorsResults[status];
  }

  static Map<String, String> _errorsResults = {
    AuthErrors.ERROR_WRONG_PASSWORD: "Senha incorreta!",
    AuthErrors.ERROR_USER_NOT_FOUND: "E-mail incorreto ou não cadastrado!",
    AuthErrors.ERROR_USER_DISABLED: "Usuário desabilitado!",
    AuthErrors.ERROR_WEAK_PASSWORD: "Senha muito fraca!",
    AuthErrors.ERROR_INVALID_EMAIL: "E-mail inválido!",
    AuthErrors.ERROR_EMAIL_ALREADY_IN_USE: "E-mail já cadastrado!",
    AuthErrors.ERROR_INVALID_CREDENTIAL: "Dados inválidos!",
    AuthErrors.ERROR_OPERATION_NOT_ALLOWED: "Feche o APP e tente novamente!",
    AuthErrors.ERROR_REQUIRES_RECENT_LOGIN: "Dados inválidos!",
    AuthErrors.ERROR_MISSING_EMAIL: "Um endereço de e-mail deve ser fornecido!",
  };
}
