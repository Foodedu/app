class UserRequest {
  String phone;
  String password;

  UserRequest({this.phone, this.password});

  UserRequest.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
