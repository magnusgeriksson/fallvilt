part of 'registrations_cubit.dart';

abstract class RegistrationsState extends Equatable {
  const RegistrationsState();

  @override
  List<Object> get props => [];
}

class RegistrationsInitial extends RegistrationsState {
  const RegistrationsInitial();
}

class RegistrationsLoaded extends RegistrationsState {
  final Registrations registrations;
  const RegistrationsLoaded(this.registrations);

  @override
  List<Object> get props => [registrations];
}

class RegistrationsError extends RegistrationsState {
  final String message;
  const RegistrationsError(this.message);

  @override
  List<Object> get props => [message];
}
