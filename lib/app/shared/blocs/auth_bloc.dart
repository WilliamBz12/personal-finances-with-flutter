import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:personal_finances/app/shared/services/auth_service.dart';
import 'package:rxdart/subjects.dart';

enum AuthStatus {
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class AuthBloc extends BlocBase {
  AuthService authService;
  AuthBloc({this.authService});

  final _userController = BehaviorSubject<String>();
  Stream<String> get outUserUID => _userController.stream;

  final _authStatusController = BehaviorSubject<AuthStatus>();
  Stream<AuthStatus> get outAuthStatus => _authStatusController.stream;

  Future verifyStatus() async {
    await authService.getCurrentUser().then((user) {
      if (user != null) {
        _userController.add(user?.uid);
      }
      sleep(Duration(seconds: 2));
      _authStatusController.add((user?.uid == null)
          ? AuthStatus.NOT_LOGGED_IN
          : AuthStatus.LOGGED_IN);
    });
  }

  Future singOut() async {
    await authService.signOut();
  }

  @override
  void dispose() {
    super.dispose();
    _authStatusController.close();
    _userController.close();
  }
}
