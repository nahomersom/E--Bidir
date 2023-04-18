import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_bidir/repositories/auth_repo.dart';
import 'package:e_bidir/repositories/bank_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../data/model/bank/bank_info.dart';
import '../../data/model/user_profile.dart';
part 'user_profile_state.dart';
part 'user_profile_event.dart';

class UserProfileBloc extends Bloc<UserProfileEvent,UserProfileState> {
  final AuthRepo userProfileRepo;

  UserProfileBloc({required this.userProfileRepo})
      :super(UserProfileState(errorMessage: '')){
    on<GetUserProfile>(_mapGetUserProfileEventToState);


  }

  void _mapGetUserProfileEventToState(event, Emitter<UserProfileState> emit) async{

    emit(state.copyWith(status: UserProfileStatus.loading,errorMessage: ''));
    try{

      Response response = await userProfileRepo.getUserProfile();
      print('********User Profile*******');
      print(jsonDecode(response.body)['user']);
      // (json.decode(response.body)['banks'] as List).map((e) => print(e)).toList();
      UserProfile userProfile =  UserProfile.fromJson(jsonDecode(response.body)['user']);
      print('********decoded*******');
      print(userProfile);
      emit(state.copyWith(
          status: UserProfileStatus.success,
          userInfo: userProfile,
          errorMessage: ''
      ));
      // playerBloc?.emit(recommendMezmurs);
    }catch(e){

      emit(state.copyWith(status: UserProfileStatus.error,errorMessage: e.toString()));
    }
  }
}
//   RecommendationMezmurBloc({required this.mezmursRepository}) : super(LoadingState()){
//     on<RecommendationEvent>((event, emit) async {
//       try{
//
//         final recommendMezmurs = await mezmursRepository.getMezmurs(true);
//
//         emit(LoadingState(recommendMezmurs));
//       }catch(e){
//
//         emit(ErrorState(e.toString()));
//       }
//
//       try{
//
//         final recommendMezmurs = await mezmursRepository.getMezmurs();
//
//         emit(LoadedState(recommendMezmurs));
//       }catch(e){
//
//         emit(ErrorState(e.toString()));
//       }
//     });
// }

