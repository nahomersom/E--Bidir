class LoginModel{
  bool success;
  dynamic login;
  String? token;
  LoginModel({
    required this.success,
    this.login,
    this.token,
  });
  factory LoginModel.fromJson(Map<String,dynamic> json) {

    return LoginModel(
      success: json['success'],
      login: json['login'],
      token: json['token'],

    );

  }
}