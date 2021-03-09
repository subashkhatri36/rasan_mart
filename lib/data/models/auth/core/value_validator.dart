import 'package:dartz/dartz.dart';
import 'package:rasan_mart/data/models/auth/core/failure.dart';

Either<String, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    // return left(ValueFailure.)
    return left('Error ');
  }
}

Either<String, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left('Error in password');
  }
}
