import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fallvilt/models/models.dart';
import 'package:fallvilt/repositories/authentication_repository_fake.dart';

part 'stats_state.dart';

class StatsCubit extends Cubit<StatsState> {
  final AuthenticationRepositoryFake _authenticationRepository;
  StatsCubit(this._authenticationRepository) : super(const StatsInitial());

  Future<void> loadStats() async {
    try {
      final stats = await _authenticationRepository.getStats();
      emit(StatsLoaded(stats));
    } on Exception {
      emit(const StatsError("Fikk ikke til å laste statistikk"));
    }
  }
}
