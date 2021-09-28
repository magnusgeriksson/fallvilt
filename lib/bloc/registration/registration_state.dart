part of 'registration_bloc.dart';

class RegistrationFormState extends Equatable {
  const RegistrationFormState(
      {this.status = FormzStatus.pure,
      this.stedsnavn = const StedsnavnTextField.dirty(),
      this.hendelsesdato = const HendelsesdatoField.pure(),
      this.ukjentTidspunkt = false,
      this.arsak = const ArsakListItemFormField.pure(),
      this.kjoretoy = const KjoretoyListItemFormField.pure()});

  RegistrationFormState copyWith(
      {FormzStatus? status,
      StedsnavnTextField? stedsnavn,
      HendelsesdatoField? hendelsesdato,
      bool? ukjentTidspunkt,
      ArsakListItemFormField? arsak,
      KjoretoyListItemFormField? kjoretoy,
      RegistrationStatus? regStatus}) {
    return RegistrationFormState(
        status: status ?? this.status,
        stedsnavn: stedsnavn ?? this.stedsnavn,
        hendelsesdato: hendelsesdato ?? this.hendelsesdato,
        ukjentTidspunkt: ukjentTidspunkt ?? this.ukjentTidspunkt,
        kjoretoy: kjoretoy ?? this.kjoretoy,
        arsak: arsak ?? this.arsak);
  }

  // factory RegistrationFormState.mapFromState(RegistrationModel registration) {
  //   return RegistrationFormState();
  // }

  final FormzStatus status;
  final StedsnavnTextField stedsnavn;
  final HendelsesdatoField hendelsesdato;
  final bool ukjentTidspunkt;
  final ArsakListItemFormField arsak;
  final KjoretoyListItemFormField kjoretoy;

  @override
  List<Object> get props => [status, stedsnavn, hendelsesdato, ukjentTidspunkt, arsak, kjoretoy];
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
