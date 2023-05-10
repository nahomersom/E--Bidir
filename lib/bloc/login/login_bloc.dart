import 'dart:convert';

import 'package:e_bidir/bloc/authentication/authentication_bloc.dart';
import 'package:e_bidir/data/model/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../data/api/api.dart';
import '../../data/model/user.dart';
import '../../repositories/user_repo.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final ApiRepository apiRepository;
  UserRepo authRepo;
  final AuthenticationCubit authenticationCubit;
  LoginBloc(this.authenticationCubit, {required this.authRepo})
      : super(LoginState(errorMessage: '')) {
    on<LoginRequest>(_onLoginRequest);
//on getCurrent user
    on<LogoutRequest>(_onLogoutRequest);
  }
  void _onLoginRequest(LoginRequest event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.initial, errorMessage: ''));
    try {
      emit(state.copyWith(status: LoginStatus.loading, errorMessage: ''));
      Response? response = await authRepo.login(event.user);
      print('ere');
      print(jsonDecode(response.body));
      LoginModel loginResponse = LoginModel.fromJson(jsonDecode(response.body));
      authenticationCubit.onAuthenticateRequest(loginResponse);
      if(jsonDecode(response.body)['login']['role']!='bank'){
        emit(state.copyWith(
            status: LoginStatus.success, user: loginResponse, errorMessage: ''));
      }else{
        emit(state.copyWith(
            status: LoginStatus.error, errorMessage:'You don\'t have have access'));
      }


    } catch (e) {
      emit(state.copyWith(
          status: LoginStatus.error, errorMessage: e.toString().replaceAll('Exception:', '')));
    }
  }

  void getCurrentUser() {
    authenticationCubit.onGetCurrentUser();
  }

  void _onLogoutRequest(LogoutRequest event, Emitter<LoginState> emit) {
    emit(state.copyWith(status: LoginStatus.initial, errorMessage: ""));
  }
}
