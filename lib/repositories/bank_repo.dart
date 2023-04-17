import 'package:http/http.dart';

import '../data/api/api_client.dart';
import '../utils/app_constants.dart';

class BankRepo{
  final ApiClient apiClient;
  BankRepo({required this.apiClient});
  Future<Response> getBanks()  async{
    return await apiClient.getData(AppConstants.getBanks);

  }
  Future<Response> getLoan()  async{
    return await apiClient.getData(AppConstants.myLoan);

  }
}