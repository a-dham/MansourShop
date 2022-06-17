class CategoriesModel {
  bool? status;
  CategoriesDataModel? data;
  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? CategoriesDataModel.fromJson(json['data'])
        : null;
  }
}

class CategoriesDataModel {
  // int? currentPage;
  List<DataModel1> data = <DataModel1>[];
  // String? firstPageUrl;
  // int? from;
  // int? lastPage;
  // String? lastPageUrl;
  // String? nextPageUrl;
  // String? path;
  // String? perPage;
  // int? to;
  // int? total;
  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    // currentPage = json['current_page'];
    data = json['data'] != null
        ? (json['data'] as List).map((i) => DataModel1.fromJson(i)).toList()
        : [];
    // firstPageUrl = json['first_page_url'];
    // from = json['from'];
    // lastPage = json['last_page'];
    // lastPageUrl = json['last_page_url'];
    // nextPageUrl = json['next_page_url'];
    // path = json['path'];
    // perPage = json['per_page'];
    // to = json['to'];
    // total = json['total'];
  }
}

class DataModel1 {
  int? id;
  String? name;
  String? image;

  DataModel1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
