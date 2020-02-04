import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:mockito/mockito.dart';

import 'package:personal_finances/app/modules/login/login_bloc.dart';
import 'package:personal_finances/app/modules/login/login_module.dart';
import 'package:personal_finances/app/shared/services/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  initModule(LoginModule());
  LoginBloc bloc;
  MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
    bloc = LoginBloc(authService: mockAuthService);
  });

  group('Login Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<LoginBloc>());
    });

    test("Should return Left in Submit", () async {
      when(mockAuthService.signIn("mail", "pass"))
          .thenAnswer((_) async => Left("error"));
      bloc.changeEmail("mail");
      bloc.changePassword("pass");
      final result = await bloc.submit();
      expect(result, equals(Left("error")));
    });

    test("Should return Right 'false' in Submit", () async {
      when(mockAuthService.signIn("mail", "pass"))
          .thenAnswer((_) async => Right(false));
      bloc.changeEmail("mail");
      bloc.changePassword("pass");
      final result = await bloc.submit();
      expect(result, equals(Right(false)));
    });

    test("Should return Right 'true' in Submit", () async {
      when(mockAuthService.signIn("mail@gm.com", "pass12"))
          .thenAnswer((_) async => Right(true));
      bloc.changeEmail("mail@gm.com");
      bloc.changePassword("pass12");
      final result = await bloc.submit();
      expect(result, equals(Right(true)));
    });
  });
}
