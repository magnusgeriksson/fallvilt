import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fallvilt/models/models.dart';
import 'package:fallvilt/repositories/repositories.dart';
import 'package:formz/formz.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationFormState> {
  RegistrationBloc({
    required RegistrationRepository registrationRepository,
  })  : _registrationRepository = registrationRepository,
        super(const RegistrationFormState());

  final RegistrationRepository _registrationRepository;

  // @override
  // Stream<RegistrationFormState> mapEventToState(
  //   RegistrationEvent event,
  // ) async* {
  //   if (event is RegistrationKjoretoyChanged) {
  //     print(event);
  //
  //     yield _mapKjoretoyChangedToState(event, state);
  //   }
  //   // else if (event is LoginPasswordChanged) {
  //   //   yield _mapPasswordChangedToState(event, state);
  //   // } else if (event is LoginSubmitted) {
  //   //   yield* _mapLoginSubmittedToState(event, state);
  //   // }
  // }

  RegistrationFormState _mapArsakChangedToState(
    RegistrationArsakChanged event,
    RegistrationFormState state,
  ) {
    return state.copyWith(
      status: Formz.validate([state.hendelsesDato]),
      arsak: event.arsak,
    );
  }

  RegistrationFormState _mapKjoretoyChangedToState(
    RegistrationKjoretoyChanged event,
    RegistrationFormState state,
  ) {
    return state.copyWith(
      status: Formz.validate([state.hendelsesDato]),
      kjoretoy: event.kjoretoy,
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

  // LoginState _mapPasswordChangedToState(
  //     LoginPasswordChanged event,
  //     LoginState state,
  //     ) {
  //   final password = Password.dirty(event.password);
  //   return state.copyWith(
  //     password: password,
  //     status: Formz.validate([password, state.username]),
  //   );
  // }
  //
  // Stream<LoginState> _mapLoginSubmittedToState(
  //     LoginSubmitted event,
  //     LoginState state,
  //     ) async* {
  //   if (state.status.isValidated) {
  //     yield state.copyWith(status: FormzStatus.submissionInProgress);
  //     try {
  //       await _authenticationRepository.logIn(
  //         username: state.username.value,
  //         password: state.password.value,
  //       );
  //       yield state.copyWith(status: FormzStatus.submissionSuccess);
  //     } on Exception catch (_) {
  //       yield state.copyWith(status: FormzStatus.submissionFailure);
  //     }
  //   }
  // }
}
