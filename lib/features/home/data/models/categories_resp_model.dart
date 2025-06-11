import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/features/home/domain/entities/category_entity.dart';

class CategoryListRespModel extends BaseListResponse {
  const CategoryListRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory CategoryListRespModel.fromJson(Map<String, dynamic> json) {
    return CategoryListRespModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? null
          : List<CategoryModel>.from(
              json["data"].map((x) => CategoryModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": data?.map((x) => x.toJson()).toList(),
    };
  }
}

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    super.id,
    super.name,
    super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
