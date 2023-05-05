import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_bidir/data/model/person.dart';
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
part 'user_profile_state.dart';
part 'user_profile_event.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserRepo userProfileRepo;

  UserProfileBloc({required this.userProfileRepo})
      : super(UserProfileState(errorMessage: '')) {
    on<GetUserProfile>(_mapGetUserProfileEventToState);
  }

  void _mapGetUserProfileEventToState(
      event, Emitter<UserProfileState> emit) async {
    emit(state.copyWith(
        userProfileStatus: UserProfileStatus.loading, errorMessage: ''));
    try {
      Response userProfileResponse = await userProfileRepo.getUserProfile();
      Response personalResponse = await userProfileRepo.getPersonalInfo();
      Response economicResponse = await userProfileRepo.getEconomicInfo();

      // (json.decode(response.body)['banks'] as List).map((e) => print(e)).toList();
      UserProfile userProfile =
          UserProfile.fromJson(jsonDecode(userProfileResponse.body)['user']);

      Person personalInfo =
          Person.fromJson(jsonDecode(personalResponse.body)['personal']);

      Economic economicInfo =
          Economic.fromJson(jsonDecode(economicResponse.body)['economic']);

      emit(state.copyWith(
          userProfileStatus: UserProfileStatus.success,
          userInfo: userProfile,
          personalInfo: personalInfo,
          economicInfo: economicInfo,
          errorMessage: ''));
      // playerBloc?.emit(recommendMezmurs);
    } catch (e) {
      emit(state.copyWith(
          userProfileStatus: UserProfileStatus.error,
          errorMessage: e.toString()));
    }
  }
}



// class EconomicBloc extends Bloc<UserProfileEvent, EconomicState> {
//   final UserRepo userRepo;

//   EconomicBloc({required this.userRepo})
//       : super(EconomicState(errorMessage: '')) {
//     on<GetEconomicInfo>(_mapGetUserProfileEventToState);
//   }

//   void _mapGetUserProfileEventToState(
//       event, Emitter<EconomicState> emit) async {
//     emit(state.copyWith(status: EconomicStatus.loading, errorMessage: ''));
//     try {
//       Response response = await userRepo.getUserProfile();
//       // (json.decode(response.body)['banks'] as List).map((e) => print(e)).toList();
//       Economic economicInfo =
//           Economic.fromJson(jsonDecode(response.body)['user']);
//       emit(state.copyWith(
//           status: EconomicStatus.success,
//           economicInfo: economicInfo,
//           errorMessage: ''));
//       // playerBloc?.emit(recommendMezmurs);
//     } catch (e) {
//       emit(state.copyWith(
//           status: EconomicStatus.error, errorMessage: e.toString()));
//     }
//   }
// }

// class PersonalBloc extends Bloc<UserProfileEvent, PersonalState> {
//   final UserRepo userRepo;

//   PersonalBloc({required this.userRepo})
//       : super(PersonalState(errorMessage: '')) {
//     on<GetEconomicInfo>(_mapGetUserProfileEventToState);
//   }

//   void _mapGetUserProfileEventToState(
//       event, Emitter<PersonalState> emit) async {
//     emit(state.copyWith(status: PersonalStatus.loading, errorMessage: ''));
//     try {
//       Response response = await userRepo.getUserProfile();
//       // (json.decode(response.body)['banks'] as List).map((e) => print(e)).toList();
//       Person person = Person.fromJson(jsonDecode(response.body)['user']);
//       emit(state.copyWith(
//           status: PersonalStatus.success, person: person, errorMessage: ''));
//       // playerBloc?.emit(recommendMezmurs);
//     } catch (e) {
//       emit(state.copyWith(
//           status: PersonalStatus.error, errorMessage: e.toString()));
//     }
//   }
// }
