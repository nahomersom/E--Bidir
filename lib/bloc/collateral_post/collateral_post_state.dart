part of 'collateral_post_bloc.dart';

// enum UserProfileStatus { loading, success, error }

// enum EconomicStatus { loading, success, error }

enum VehicleStatus { initial, loading, success, error }

enum BuildingsStatus { initial, loading, success, error }

// extension UserProfileStatusx on UserProfileStatus {
//   bool get isUserProfileLoading => this == UserProfileStatus.loading;
//   bool get isUserProfileSuccess => this == UserProfileStatus.success;
//   bool get hasUserProfileError => this == UserProfileStatus.error;
// }
extension VehicleStatusx on VehicleStatus {
  bool get isVheicleInitial => this == VehicleStatus.initial;
  bool get isVheicleLoading => this == VehicleStatus.loading;
  bool get isVheicleSuccess => this == VehicleStatus.success;
  bool get hasVehicleError => this == VehicleStatus.error;
}

extension CollateralStatusx on BuildingsStatus {
  bool get isBuildingInitial => this == BuildingsStatus.initial;
  bool get isBuildingLoading => this == BuildingsStatus.loading;
  bool get isBuildingSuccess => this == BuildingsStatus.success;
  bool get hasBuildingError => this == BuildingsStatus.error;
}

class CollateralPostState extends Equatable {
  CollateralPostState({
    this.vehicleStatus = VehicleStatus.initial,
    this.buildingsStatus = BuildingsStatus.initial,
    VehicleBody? vehicleBody,
    BuildingBody? buildingBody,
    required this.vehicleErrorMessage,
    required this.buildingErrorMessage,
  })  : vehicleBody = vehicleBody,
        buildingBody = buildingBody;

  final VehicleStatus vehicleStatus;
  final BuildingsStatus buildingsStatus;
  final VehicleBody? vehicleBody;
  final BuildingBody? buildingBody;
  final String vehicleErrorMessage;
  final String buildingErrorMessage;
  @override
  List<Object?> get props => [
        vehicleStatus,
        buildingsStatus,
        vehicleBody,
        buildingBody,
        vehicleErrorMessage,
        buildingErrorMessage
      ];

  CollateralPostState copyWith(
      {VehicleStatus? vehicleStatus,
      BuildingsStatus? buildingsStatus,
      VehicleBody? vehicleBody,
      BuildingBody? buildingBody,
      vehicleErrorMessage,
      buildingErrorMessage}) {
    return CollateralPostState(
        vehicleStatus: vehicleStatus ?? this.vehicleStatus,
        buildingsStatus: buildingsStatus ?? this.buildingsStatus,
        vehicleBody: vehicleBody ?? this.vehicleBody,
        buildingBody: buildingBody ?? this.buildingBody,
        vehicleErrorMessage: vehicleErrorMessage,
        buildingErrorMessage: buildingErrorMessage);
  }
}
