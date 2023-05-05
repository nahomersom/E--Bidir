part of 'collaterals_bloc.dart';

enum MyCollateralStatus { loading, success, error }

extension CollateralStatusx on MyCollateralStatus {
  bool get isLoading => this == MyCollateralStatus.loading;
  bool get isSuccess => this == MyCollateralStatus.success;
  bool get hasError => this == MyCollateralStatus.error;
}

class CollateralsState extends Equatable {
  const CollateralsState(
      {this.status = MyCollateralStatus.loading,
      List<Car>? cars,
      List<Building>? buildings,
      required this.errorMessage})
      : carsList = cars ?? const [],
        buildingList = buildings ?? const [];
  final MyCollateralStatus status;
  final List<Car> carsList;
  final List<Building> buildingList;
  final String errorMessage;
  @override
  List<Object> get props => [status, carsList, buildingList, errorMessage];
  CollateralsState copyWith(
      {MyCollateralStatus? status,
      List<Car>? carsList,
      List<Building>? buildingsList,
      errorMessage}) {
    return CollateralsState(
        status: status ?? this.status,
        cars: carsList ?? this.carsList,
        buildings: buildingsList ?? this.buildingList,
        errorMessage: errorMessage);
  }
}
