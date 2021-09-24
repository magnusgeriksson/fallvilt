part of 'registration_bloc.dart';

// abstract class RegistrationState extends Equatable {
//   const RegistrationState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class StatusChangedEvent extends RegistrationFormState {
//   const StatusChangedEvent(this.regStatus);
//
//   final RegistrationStatus regStatus;
//
//   @override
//   List<Object> get props => [regStatus];
// }

class RegistrationFormState extends Equatable {
  const RegistrationFormState(
      {this.status = FormzStatus.pure,
      this.hendelsesDato = const DateField.pure(),
      this.arsak = const ArsakListItemFormField.pure(),
      this.kjoretoy = const KjoretoyListItemFormField.pure()});

  RegistrationFormState copyWith(
      {FormzStatus? status,
      DateField? hendelsesDato,
      ArsakListItemFormField? arsak,
      KjoretoyListItemFormField? kjoretoy,
      Object? regStatus}) {
    return RegistrationFormState(
        status: status ?? this.status,
        hendelsesDato: hendelsesDato ?? this.hendelsesDato,
        kjoretoy: kjoretoy ?? this.kjoretoy,
        arsak: arsak ?? this.arsak);
  }

  final FormzStatus status;
  final DateField hendelsesDato;
  final ArsakListItemFormField arsak;
  final KjoretoyListItemFormField kjoretoy;

  @override
  List<Object> get props => [status, hendelsesDato, arsak, kjoretoy];
}

class SetKjotetoyListItem extends RegistrationFormState {}

// class ValidateEvent extends RegistrationState {}
//
// class ArsakEvent extends RegistrationState {
//   const ArsakEvent(this.text);
//
//   final String text;
//
//   @override
//   List<Object> get props => [text];
// }

// class DetteErEnRegistrationEvent extends RegistrationState {
//   const DetteErEnRegistrationEvent(this.text);
//
//   final String text;
//
//   @override
//   List<Object> get props => [text];
// }
//
// class LoadingState extends RegistrationState {
//   @override
//   List<Object> get props => [];
// }
//
// class LoadedState extends RegistrationState {
//   LoadedState();
//
//   // final List<MovieModel> movies;
//
//   @override
//   List<Object> get props => [];
// }
//
// class ErrorState extends RegistrationState {
//   @override
//   List<Object> get props => [];
// }
