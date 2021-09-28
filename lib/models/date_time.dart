import 'package:formz/formz.dart';

enum DateTimeValidationError { empty }

class DateField extends FormzInput<DateTime?, DateTimeValidationError> {
  const DateField.pure() : super.pure(null);
  const DateField.dirty([DateTime? value]) : super.dirty(value);

  @override
  DateTimeValidationError? validator(DateTime? value) {
    return value != null ? null : DateTimeValidationError.empty;
  }
}

class HendelsesdatoField extends DateField {
  const HendelsesdatoField.pure() : super.pure();
  const HendelsesdatoField.dirty([DateTime? value]) : super.dirty(value);
}
