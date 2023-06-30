import 'package:equatable/equatable.dart';

abstract class ExplorerEvent extends Equatable {}

class GetExplorerPageEvent extends ExplorerEvent {
  final String rankingType;

  GetExplorerPageEvent({required this.rankingType});

  @override
  List<Object?> get props => [rankingType];
}

class TestEvent extends ExplorerEvent {
  @override
  List<Object?> get props => [];
}
