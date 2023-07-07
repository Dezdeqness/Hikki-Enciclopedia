import 'package:equatable/equatable.dart';

class StatsEntity extends Equatable {
  final int numListUsers;
  final int watching;
  final int completed;
  final int onHold;
  final int dropped;
  final int planToWatch;

  const StatsEntity({
    required this.numListUsers,
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
  });

  @override
  List<Object?> get props => [
        numListUsers,
        watching,
        completed,
        onHold,
        dropped,
        planToWatch,
      ];
}
