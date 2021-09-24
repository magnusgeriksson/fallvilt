import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fallvilt/models/registration_list_model.dart';
import 'package:fallvilt/repositories/registration_repository_fake.dart';

part 'registrations_state.dart';

class RegistrationsCubit extends Cubit<RegistrationsState> {
  final RegistrationRepositoryFake _registrationRepository;
  RegistrationsCubit(this._registrationRepository) : super(const RegistrationsInitial());

  Future<void> loadRegistrations() async {
    try {
      final registrations = await _registrationRepository.getRegistrations();
      emit(RegistrationsLoaded(registrations));
    } on Exception {
      emit(const RegistrationsError("Fikk ikke til å laste statistikk"));
    }
  }
}
