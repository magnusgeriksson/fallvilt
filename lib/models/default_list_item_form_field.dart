import 'package:fallvilt/dataservice/models/models.dart';
import 'package:formz/formz.dart';

enum DefaultListItemValidationError { empty }

class DefaultListItemFormField extends FormzInput<DefaultListItem, DefaultListItemValidationError> {
  const DefaultListItemFormField.pure() : super.pure(const DefaultListItem());
  const DefaultListItemFormField.dirty([DefaultListItem value = const DefaultListItem()]) : super.dirty(value);

  @override
  DefaultListItemValidationError? validator(DefaultListItem? value) {
    return value?.text.isNotEmpty ?? false ? null : DefaultListItemValidationError.empty;
  }
}

class ArsakListItemFormField extends DefaultListItemFormField {
  const ArsakListItemFormField.pure() : super.pure();
  const ArsakListItemFormField.dirty([DefaultListItem value = const DefaultListItem()]) : super.dirty(value);
}

class KjoretoyListItemFormField extends DefaultListItemFormField {
  const KjoretoyListItemFormField.pure() : super.pure();
  const KjoretoyListItemFormField.dirty([DefaultListItem value = const DefaultListItem()]) : super.dirty(value);
}
