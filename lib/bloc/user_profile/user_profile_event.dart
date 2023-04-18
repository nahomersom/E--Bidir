
part of 'user_profile_bloc.dart';
abstract class UserProfileEvent extends Equatable{
  @override
  List<Object> get props=>[];
}
class GetUserProfile extends UserProfileEvent{}
class GetEconomicInfo extends UserProfileEvent{}
