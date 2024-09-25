class CategoriesModel {
  String? name;
  String? image;
  int? id;

  CategoriesModel.fromjson({required Map<String, dynamic> data}) {
    name = data['name'];
    image = data['image'];
    id = data['id'];
  }
}
