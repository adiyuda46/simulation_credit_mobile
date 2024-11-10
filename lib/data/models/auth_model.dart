class UserModel {
  final String token;

  UserModel({required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(token: json['token']);
  }
}

class LoginModel {
  final String token;
  final String message;

  LoginModel({required this.token, required this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final data = json['data']; 
    return LoginModel(
      token: data['Token'], 
      message: data['Message'], 
    );
  }
}


class RegisterModel {
  final String token;
  final String message;

  RegisterModel({required this.token, required this.message});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    final data = json['data']; 
    return RegisterModel(
      token: data['Token'], 
      message: data['Message'], 
    );
  }
}