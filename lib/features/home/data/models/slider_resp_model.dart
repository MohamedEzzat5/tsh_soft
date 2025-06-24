import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/features/home/domain/entities/slider_entity.dart';

class GetSlidersRespModel extends BaseListResponse {
  GetSlidersRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory GetSlidersRespModel.fromJson(Map<String, dynamic> json) =>
      GetSlidersRespModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SliderModel>.from(
                json["data"]!.map((x) => SliderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => (x as SliderModel).toJson())),
      };
}

class SliderModel extends SliderEntity {
  const SliderModel({
    super.id,
    super.link,
    super.image,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        id: json["id"],
        link: json["link"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "image": image,
      };
}
