part of 'collateral_post_bloc.dart';

abstract class CollateralPostEvent extends Equatable {
  const CollateralPostEvent();

  @override
  List<Object> get props => [];
}

class PostVehicle extends CollateralPostEvent {
  final VehicleBody vehicleBody;

  PostVehicle(this.vehicleBody);
  @override
  List<Object> get props => [vehicleBody];
}

class PostBuilding extends CollateralPostEvent {
  final BuildingBody buildingBody;

  PostBuilding(this.buildingBody);
  @override
  List<Object> get props => [buildingBody];
}
