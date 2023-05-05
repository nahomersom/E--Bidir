part of 'collaterals_bloc.dart';

abstract class CollateralsEvent extends Equatable {
  const CollateralsEvent();

  @override
  List<Object> get props => [];
}

class GetCollaterals extends CollateralsEvent {}
