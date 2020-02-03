import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:personal_finances/app/shared/services/auth_service.dart';
import 'package:personal_finances/app/shared/validators/validator_email.dart';
import 'package:personal_finances/app/shared/validators/validator_password.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc extends BlocBase with ValidatorEmail, ValidatorPassword {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  AuthService authService;
  LoginBloc({this.authService});

  // Add data to streamx'
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  //Validation form
  Stream<bool> get submitIsValid =>
      CombineLatestStream.combine2(email, password, (e, p) => true);

  // change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Future<bool> submit() async {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    final response = await authService.signIn(validEmail, validPassword);
    return response != null;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.close();
    _passwordController.close();
  }
}
