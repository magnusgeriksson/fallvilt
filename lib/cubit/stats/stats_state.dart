part of 'stats_cubit.dart';

abstract class StatsState extends Equatable {
  const StatsState();

  @override
  List<Object> get props => [];
}

//Før stats er lastet - vis loadingindicator
class StatsInitial extends StatsState {
  const StatsInitial();
}

class StatsLoaded extends StatsState {
  final Stats stats;
  const StatsLoaded(this.stats);
}

class StatsError extends StatsState {
  final String message;
  const StatsError(this.message);
}
