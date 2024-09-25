class HomeModel {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  HomeModel.fromJson({
    required Map<String, dynamic> data,
  }) {
    id = data['id'];
    price = data['price'];
    oldPrice = data['old_price'];
    discount = data['discount'];
    image = data['image'];
    name = data['name'];
    description = data['description'];
    images = data['images'].cast<String>();
    inFavorites = data['in_favorites'];
    inCart = data['in_cart'];
  }
}
