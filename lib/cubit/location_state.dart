import 'package:equatable/equatable.dart';

abstract class LocationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {
  @override
  List<Object?> get props => [];
}

class LocationSuccess extends LocationState {
  @override
  List<Object?> get props => [];
}

class LocationError extends LocationState {
  @override
  List<Object?> get props => [];
}

class PointInitial extends LocationState {
  @override
  List<Object?> get props => [];
}

class PointSuccess extends LocationState {
  @override
  List<Object?> get props => [];
}
class PointRemoved extends LocationState {
  @override
  List<Object?> get props => [];
}

class PointError extends LocationState {
  @override
  List<Object?> get props => [];
}
