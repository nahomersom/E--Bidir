part of 'personal_bloc.dart';

abstract class PersonalEvent extends Equatable {
  const PersonalEvent();

  @override
  List<Object> get props => [];
}

class GePersonalProfile extends PersonalEvent {
  @override
  List<Object> get props => [];
}

class UpdatePersonalProfile extends PersonalEvent {
  final Person person;

  UpdatePersonalProfile(this.person);
  @override
  List<Object> get props => [person];
}
