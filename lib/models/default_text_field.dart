import 'package:formz/formz.dart';

enum DefaultTextFieldValidationError { empty }

class DefaultTextField extends FormzInput<String, DefaultTextFieldValidationError> {
  const DefaultTextField.pure() : super.pure('');
  const DefaultTextField.dirty([String value = '']) : super.dirty(value);

  @override
  DefaultTextFieldValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : DefaultTextFieldValidationError.empty;
  }
}

class StedsnavnTextField extends DefaultTextField {
  const StedsnavnTextField.pure() : super.pure();
  const StedsnavnTextField.dirty([String value = '']) : super.dirty(value);
}
