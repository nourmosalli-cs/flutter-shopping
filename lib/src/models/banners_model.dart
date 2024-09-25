class BannersModel {
  int? id;
  String? image;

  BannersModel.fromjson({required Map<String, dynamic> data}) {
    id = data['id'];
    image = data['image'];
  }
}
