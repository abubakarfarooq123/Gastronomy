class CategoryModel {
  int id;
  String name;
  String image;
  String categoryImagePath;

  CategoryModel({this.id, this.name, this.image, this.categoryImagePath});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    categoryImagePath = json['category_image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['category_image_path'] = this.categoryImagePath;
    return data;
  }
}
