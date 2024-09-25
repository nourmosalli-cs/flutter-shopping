class UserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserModel({this.name, this.email, this.phone, this.image, this.token});

  UserModel.fromJson({required Map<String, dynamic> data}) {
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
    token = data['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['token'] = this.token;
    return data;
  }
}
