import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
 @override
 List<Object?> get props => [];
}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

