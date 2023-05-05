part of 'economic_bloc.dart';

abstract class EconomicEvent extends Equatable {
  const EconomicEvent();

  @override
  List<Object> get props => [];
}

class OnGetEconomicInfo extends EconomicEvent {}

class OnUpdateEconomy extends EconomicEvent {
  final Economic economic;
  OnUpdateEconomy(this.economic);
  @override
  List<Object> get props => [];
}
