import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_bidir/data/model/buildings.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../../data/model/car.dart';
import '../../repositories/user_repo.dart';

part 'collaterals_event.dart';
part 'collaterals_state.dart';

class CollateralsBloc extends Bloc<CollateralsEvent, CollateralsState> {
  final UserRepo collateralsRepo;

  CollateralsBloc({required this.collateralsRepo})
      : super(CollateralsState(errorMessage: '')) {
    on<GetCollaterals>(_mapGetUserProfileEventToState);
  }

  void _mapGetUserProfileEventToState(
      event, Emitter<CollateralsState> emit) async {
    emit(state.copyWith(status: MyCollateralStatus.loading, errorMessage: ''));
    try {
      Response carsResponse = await collateralsRepo.getCars();
      Response buildingsResponse = await collateralsRepo.getBuilding();

      // (json.decode(response.body)['banks'] as List).map((e) => print(e)).toList();
      print('cars');
      print(carsResponse.body);
      List<Car> cars = (jsonDecode(carsResponse.body)['mycars'] as List)
          .map((e) => Car.fromJson(e))
          .toList();

      List<Building> buildings =
          (jsonDecode(buildingsResponse.body)['buildings'] as List)
              .map((e) => Building.fromJson(e))
              .toList();

      emit(state.copyWith(
          status: MyCollateralStatus.success,
          carsList: cars,
          buildingsList: buildings,
          errorMessage: ''));
      // playerBloc?.emit(recommendMezmurs);
    } catch (e) {
      emit(state.copyWith(
          status: MyCollateralStatus.error, errorMessage: e.toString()));
    }
  }
}
