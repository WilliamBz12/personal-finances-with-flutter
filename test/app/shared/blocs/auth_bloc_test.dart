import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:personal_finances/app/shared/blocs/auth_bloc.dart';
import 'package:personal_finances/app/shared/services/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

class FirebaseUserMock extends Mock implements FirebaseUser {}

void main() {
  AuthBloc bloc;
  MockAuthService mockAuthService;
  FirebaseUserMock firebaseUserMock;

  setUp(() {
    mockAuthService = MockAuthService();
    bloc = AuthBloc(authService: mockAuthService);
    firebaseUserMock = FirebaseUserMock();
  });

  group('Auth Bloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<AuthBloc>());
    });

    test("Should return that user is not logged", () async {
      when(mockAuthService.getCurrentUser()).thenAnswer((_) async => null);

      await bloc.verifyStatus();

      bloc.outAuthStatus.listen((data) {
        if (data != null) {
          expect(data, AuthStatus.NOT_LOGGED_IN);
        }
      });
    });

    test("Should return that user is logged", () async {
      when(mockAuthService.getCurrentUser()).thenAnswer(
        (_) async => Future<FirebaseUserMock>.value(firebaseUserMock),
      );

      await bloc.verifyStatus();

      bloc.outAuthStatus.listen((data) {
        if (data != null) {
          expect(data, AuthStatus.LOGGED_IN);
        }
      });
    });
  });
}
