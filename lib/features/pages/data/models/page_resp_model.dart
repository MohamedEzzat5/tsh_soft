import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/features/pages/domain/entities/page_entity.dart';

class GetPageRespModel extends BaseOneResponse {
  GetPageRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory GetPageRespModel.fromJson(Map<String, dynamic> json) =>
      GetPageRespModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? PageModel.fromJson(json['data']) : null,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data != null ? (data as PageModel).toJson() : null,
      };
}

class PageModel extends PageEntity {
  const PageModel({
    super.title,
    super.content,
  });

  factory PageModel.fromJson(Map<String, dynamic> json) => PageModel(
        title: json['title'],
        content: json['content'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
}
