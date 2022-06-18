class FavouritesModel {
  bool? status;
  String? message;
  FavouritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}

class Favourites {
  bool? status;
  Data? data;

  Favourites.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  int? currentPage;
  List<DataProducts>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataProducts>[];
      json['data'].forEach((v) {
        data!.add(DataProducts.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class DataProducts {
  int? id;
  Product? product;

  DataProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = Product.fromJson(json['product']);
  }
}

class Product {
  int? id;
  double? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'].toDouble();
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
