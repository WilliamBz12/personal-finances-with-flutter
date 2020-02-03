import 'dart:async';

class ValidatorPassword {
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 5) {
        sink.add(password);
      } else {
        sink.addError('Invalid password, please enter more than 5 characters');
      }
    },
  );
}
