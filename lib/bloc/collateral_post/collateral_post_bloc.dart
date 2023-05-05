import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_bidir/data/model/person.dart';
import 'package:e_bidir/data/model/request/building_request.dart';
import 'package:e_bidir/data/model/request/vehicle_request.dart';
import 'package:e_bidir/repositories/user_repo.dart';
import 'package:e_bidir/repositories/bank_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../data/model/bank/bank_info.dart';
import '../../data/model/economic-second.dart';
import '../../data/model/economic.dart';
import '../../data/model/user_profile.dart';
part 'collateral_post_state.dart';
part 'collateral_post_event.dart';

class CollateralBloc extends Bloc<CollateralPostEvent, CollateralPostState> {
  final UserRepo collateralRepo;

  CollateralBloc({required this.collateralRepo})
      : super(CollateralPostState(
            vehicleErrorMessage: '', buildingErrorMessage: '')) {
    on<PostBuilding>(_mapPostBuildingEventToState);
    on<PostVehicle>(_mapPostVehicleEventToState);
  }

  void _mapPostVehicleEventToState(
      event, Emitter<CollateralPostState> emit) async {

    emit(state.copyWith(
        vehicleStatus: VehicleStatus.initial,
        vehicleErrorMessage: '',
        buildingErrorMessage: ''));
    try {
      emit(state.copyWith(
          vehicleStatus: VehicleStatus.loading,
          vehicleErrorMessage: '',
          buildingErrorMessage: ''));

      Response? vehicleResponse =
          await collateralRepo.addVehicle(event.vehicleBody);

      emit(state.copyWith(
          vehicleStatus: VehicleStatus.success,
          vehicleErrorMessage: '',
          buildingErrorMessage: ''));
      // playerBloc?.emit(recommendMezmurs);
    } catch (e) {
      print('evenekjke');
      print(e.toString());
      emit(state.copyWith(
          vehicleStatus: VehicleStatus.error,
          buildingErrorMessage: '',
          vehicleErrorMessage: e.toString()));
    }
  }

  void _mapPostBuildingEventToState(
      event, Emitter<CollateralPostState> emit) async {

    emit(state.copyWith(
        buildingsStatus: BuildingsStatus.initial,
        vehicleErrorMessage: '',
        buildingErrorMessage: ''));
    try {

      emit(state.copyWith(
          buildingsStatus: BuildingsStatus.loading,
          vehicleErrorMessage: '',
          buildingErrorMessage: ''));

      Response? vehicleResponse =
          await collateralRepo.addBuilding(event.buildingBody);

      emit(state.copyWith(
          buildingsStatus: BuildingsStatus.success,
          vehicleErrorMessage: '',
          buildingErrorMessage: ''));
      // playerBloc?.emit(recommendMezmurs);
    } catch (e) {
      emit(state.copyWith(
          buildingsStatus: BuildingsStatus.error,
          vehicleErrorMessage: '',
          buildingErrorMessage: e.toString()));
    }
  }
}
