import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fallvilt/dataservice/registration_storage_service_moor.dart';
import 'package:fallvilt/models/models.dart';
import 'package:fallvilt/repositories/repositories.dart';
import 'package:formz/formz.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationFormState> {
  RegistrationBloc({
    required IRegistrationRepository registrationRepository,
  })  : _registrationRepository = registrationRepository,
        super(const RegistrationFormState());

  final IRegistrationRepository _registrationRepository;

  RegistrationFormState _mapArsakChangedToState(
    RegistrationArsakChanged event,
    RegistrationFormState state,
  ) {
    return state.copyWith(
      // status: Formz.validate([state.hendelsesDato]),
      arsak: event.arsak,
    );
  }

  RegistrationFormState _mapKjoretoyChangedToState(
    RegistrationKjoretoyChanged event,
    RegistrationFormState state,
  ) {
    return state.copyWith(
      // status: Formz.validate([state.hendelsesDato]),
      kjoretoy: event.kjoretoy,
    );
  }

  RegistrationFormState _mapStedsnavnChangedToState(
    RegistrationStedsnavnChanged event,
    RegistrationFormState state,
  ) {
    var stedsnavn = StedsnavnTextField.dirty(event.stedsnavn);

    return state.copyWith(
      stedsnavn: stedsnavn,
    );
  }

  RegistrationFormState _mapHendelsesdatoChangedToState(
    RegistrationHendelsesdatoChanged event,
    RegistrationFormState state,
  ) {
    var stedsnavn = HendelsesdatoField.dirty(event.hendelsesdato);

    return state.copyWith(
      hendelsesdato: stedsnavn,
    );
  }

  RegistrationFormState _mapUkjentTidspunktChangedToState(
    RegistrationUkjentTidspunktChanged event,
    RegistrationFormState state,
  ) {
    return state.copyWith(
      ukjentTidspunkt: event.ukjentTidspunkt,
    );
  }

  @override
  Stream<RegistrationFormState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is RegistrationKjoretoyChanged) {
      print(event);
      yield _mapKjoretoyChangedToState(event, state);
    }
    if (event is RegistrationArsakChanged) {
      print(event);
      yield _mapArsakChangedToState(event, state);
    }
    if (event is RegistrationStedsnavnChanged) {
      print(event);
      yield _mapStedsnavnChangedToState(event, state);
    }
    if (event is RegistrationHendelsesdatoChanged) {
      print(event);
      yield _mapHendelsesdatoChangedToState(event, state);
    }
    if (event is RegistrationUkjentTidspunktChanged) {
      print(event);
      yield _mapUkjentTidspunktChangedToState(event, state);
    }
    if (event is SaveSubmitted) {
      print(event);
      yield* _mapSaveSubmittedToState(event, state);
    }
  }

  Future<List<ArsakListItemFormField>> getArsakListItem() async {
    var defaultListItems = await _registrationRepository.getListItem(0);

    var mappedListItemFormFields = defaultListItems.map((e) => ArsakListItemFormField.dirty(e)).toList();

    return mappedListItemFormFields;
  }

  Future<List<KjoretoyListItemFormField>> getKjoretoyListItem() async {
    var defaultListItems = await _registrationRepository.getListItem(0);

    var mappedListItemFormFields = defaultListItems.map((e) => KjoretoyListItemFormField.dirty(e)).toList();

    return mappedListItemFormFields;
  }

  Stream<List<Registration>> get watchAllRegistrations => _registrationRepository.watchAllRegistration;

  Stream<RegistrationFormState> _mapSaveSubmittedToState(
    SaveSubmitted event,
    RegistrationFormState state,
  ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      await Future.delayed(const Duration(seconds: 2));

      var dummyRegistration = Registration(name: "test", completed: true);
      await _registrationRepository.saveRegistration(dummyRegistration);

      yield state.copyWith(status: FormzStatus.submissionSuccess);
    } on Exception catch (_) {
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }
}
