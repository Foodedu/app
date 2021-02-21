class User {
  String username;
  String phone;
  String token;
  num id;

  User({this.username, this.phone, this.token});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    phone = json['phone'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['phone'] = phone;
    data['token'] = token;
    data['id'] = id;
    return data;
  }
}
