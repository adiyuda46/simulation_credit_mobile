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
    if (data == null) {
      throw Exception('Data is null');
    }
    return RegisterModel(
      token: data['Token'] ?? 'No Token', 
      message: data['message'] ?? 'No Message', 
    );
  }
}



class DetailAccountModel {
  final String name;
  final String email;
  final String phone;

  DetailAccountModel({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory DetailAccountModel.fromJson(Map<String, dynamic> json) {
    // Mengakses data dari objek 'Deatail Account'
    final detailAccountData = json; // Data yang diterima sudah sesuai

    return DetailAccountModel(
      name: detailAccountData['Name'] ?? 'Unknown', // Menyediakan nilai default jika null
      email: detailAccountData['Email'] ?? 'Unknown',
      phone: detailAccountData['Phone'] ?? 'Unknown',
    );
  }
}
