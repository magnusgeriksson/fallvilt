part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationKjoretoyChanged extends RegistrationEvent {
  const RegistrationKjoretoyChanged(this.kjoretoy);

  final KjoretoyListItemFormField kjoretoy;

  @override
  List<Object> get props => [kjoretoy];
}

class RegistrationArsakChanged extends RegistrationEvent {
  const RegistrationArsakChanged(this.arsak);

  final ArsakListItemFormField arsak;

  @override
  List<Object> get props => [arsak];
}

// class LoginPasswordChanged extends RegistrationEvent {
//   const LoginPasswordChanged(this.password);
//
//   final String password;
//
//   @override
//   List<Object> get props => [password];
// }

class LoginSubmitted extends RegistrationEvent {
  const LoginSubmitted();
}
