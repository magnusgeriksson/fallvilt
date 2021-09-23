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

class RegistrationStedsnavnChanged extends RegistrationEvent {
  const RegistrationStedsnavnChanged(this.stedsnavn);

  final String stedsnavn;

  @override
  List<Object> get props => [stedsnavn];
}

class RegistrationHendelsesdatoChanged extends RegistrationEvent {
  const RegistrationHendelsesdatoChanged(this.hendelsesdato);

  final DateTime hendelsesdato;

  @override
  List<Object> get props => [hendelsesdato];
}

class RegistrationUkjentTidspunktChanged extends RegistrationEvent {
  const RegistrationUkjentTidspunktChanged(this.ukjentTidspunkt);

  final bool ukjentTidspunkt;

  @override
  List<Object> get props => [ukjentTidspunkt];
}

class SaveSubmitted extends RegistrationEvent {
  const SaveSubmitted();
}
