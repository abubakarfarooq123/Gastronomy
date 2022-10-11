// import 'package:get/get.dart';

// class AllServiceData {
//   int id;
//   int mainCategory;
//   String name;
//   Null image;
//   String status;
//   String createdAt;
//   String updatedAt;
//   String categoryType;
//   String slug;
//   String categoryImagePath;
//   var isBottomContainerOpen = false.obs;
//   List<AllServiceServiceSubcategory> serviceSubcategory = [];

//   AllServiceData(
//       {this.id,
//       this.mainCategory,
//       this.name,
//       this.image,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.categoryType,
//       this.slug,
//       this.categoryImagePath,
//       this.serviceSubcategory});

//   AllServiceData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     mainCategory = json['main_category'];
//     name = json['name'];
//     image = json['image'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     categoryType = json['category_type'];
//     slug = json['slug'];
//     categoryImagePath = json['category_image_path'];
//     if (json['service_subcategory'] != null) {
//       json['service_subcategory'].forEach((v) {
//         serviceSubcategory.add(new AllServiceServiceSubcategory.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['main_category'] = this.mainCategory;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['category_type'] = this.categoryType;
//     data['slug'] = this.slug;
//     data['category_image_path'] = this.categoryImagePath;
//     if (this.serviceSubcategory != null) {
//       data['service_subcategory'] =
//           this.serviceSubcategory.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }

//   static List<AllServiceData> getData(dynamic arrData) {
//     List<AllServiceData> arrTemp = [];

//     arrData.forEach((v) {
//       arrTemp.add(new AllServiceData.fromJson(v));
//     });

//     return arrTemp;
//   }
// }

// class AllServiceServiceSubcategory {
//   int id;
//   int storeId;
//   String categoryId;
//   int subcategoryId;
//   String serviceName;
//   String serviceImagePath;
//   var isSelected = false.obs;

//   AllServiceServiceSubcategory(
//       {this.id,
//       this.storeId,
//       this.categoryId,
//       this.subcategoryId,
//       this.serviceName,
//       this.serviceImagePath});

//   AllServiceServiceSubcategory.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     storeId = json['store_id'];
//     categoryId = json['category_id'];
//     subcategoryId = json['subcategory_id'];
//     serviceName = json['service_name'];
//     serviceImagePath = json['service_image_path'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['store_id'] = this.storeId;
//     data['category_id'] = this.categoryId;
//     data['subcategory_id'] = this.subcategoryId;
//     data['service_name'] = this.serviceName;
//     data['service_image_path'] = this.serviceImagePath;
//     return data;
//   }

//   static List<AllServiceServiceSubcategory> getData(dynamic arrData) {
//     List<AllServiceServiceSubcategory> arrTemp = [];

//     arrData.forEach((v) {
//       arrTemp.add(new AllServiceServiceSubcategory.fromJson(v));
//     });

//     return arrTemp;
//   }
// }
