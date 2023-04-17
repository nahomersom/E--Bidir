
part of 'banks_bloc.dart';
abstract class BanksEvent extends Equatable{
  @override
  List<Object> get props=>[];
}
class GetBanks extends BanksEvent{}
