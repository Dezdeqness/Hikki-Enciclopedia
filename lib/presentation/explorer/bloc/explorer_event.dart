import 'package:equatable/equatable.dart';

abstract class ExplorerEvent extends Equatable {}

class GetExplorerPageEvent extends ExplorerEvent {
  final String rankingType;

  GetExplorerPageEvent({required this.rankingType});

  @override
  List<Object?> get props => [rankingType];
}

class GetExplorerNextPageEvent extends ExplorerEvent {
  GetExplorerNextPageEvent();

  @override
  List<Object?> get props => [];
}

class RefreshEvent extends ExplorerEvent {
  RefreshEvent();

  @override
  List<Object?> get props => [];
}