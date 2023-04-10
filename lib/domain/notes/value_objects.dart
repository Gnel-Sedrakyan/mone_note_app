import 'package:dartz/dartz.dart';
import 'package:mone_note_app/domain/core/failures.dart';
import 'package:mone_note_app/domain/core/value_objects.dart';

class Tag extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Tag(String input) {
    return Tag._(
      Right(input),
    );
  }

  const Tag._(this.value);
}
