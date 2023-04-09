import 'package:dartz/dartz.dart';
import 'package:mone_note_app/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  }
  return right(input);
}

Either<ValueFailure<num>, num> validateNotNegative(num input) {
  if (input >= 0) {
    return right(input);
  }
  return left(ValueFailure.negative(failedValue: input));
}

Either<ValueFailure<String>, String> validateNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  }
  return left(ValueFailure.negative(failedValue: input));
}
