class HomeModel {
  bool? status;
  DataModel? data;

  HomeModel({
    this.status,
    this.data,
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }
}

class DataModel {
  List<ProductsModel> products = <ProductsModel>[];
  List<BannersModel> banners = <BannersModel>[];

  String? ad;

  DataModel.fromJson(Map<String, dynamic> json) {
    banners = json['banners'] != null
        ? (json['banners'] as List)
            .map((i) => BannersModel.fromJson(i))
            .toList()
        : [];

    products = json["products"] != null
        ? (json['products'] as List)
            .map((i) => ProductsModel.fromJson(i))
            .toList()
        : [];

    ad = json['ad'];
  }
}

class ProductsModel {
  int? id;
  double? price;
  double? oldPrice;
  double? discount;
  String? name;
  String? image;
  String? description;
  bool? isFavorite;
  bool? isCart;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'].toDouble();
    oldPrice = json['old_Price'];
    discount = json['discount'].toDouble();
    name = json['name'];
    image = json['image'];
    description = json['description'];
    isFavorite = json['in_favorites'];
    isCart = json['in_cart'];
  }
}

class BannersModel {
  int? id;
  String? image;

  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}
