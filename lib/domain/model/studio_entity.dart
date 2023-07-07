import 'package:equatable/equatable.dart';

class StudioEntity extends Equatable {
  final int id;
  final String name;

  const StudioEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
