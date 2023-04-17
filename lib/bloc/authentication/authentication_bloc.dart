import 'package:e_bidir/data/model/login_model.dart';
import 'package:e_bidir/utils/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/local_storage_service.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';
class AuthenticationCubit extends Cubit<AuthenticationState>{
  final AuthService storageService;
  AuthenticationCubit({required this.storageService}):super(AuthenticationState(status: AuthenticationStatus.unauthenticated)){}
  void onAuthenticateRequest(LoginModel user) async{
    try{

       await storageService.writeToken(user);
       emit(state.copyWith(status: AuthenticationStatus.authenticated));

    }catch(e){
      emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
    }
  }
  void onGetCurrentUser() async{
    try{
      await storageService.readToken(AppConstants.token);


      emit(state.copyWith(status: AuthenticationStatus.authenticated));

    }catch(e){
      emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
    }
  }
  void _onClearToken(AuthenticateRequest event, Emitter<AuthenticationState> emit) async{
    await storageService.removeToken();
    emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
  }
}