import '/core/base_classes/base_one_response.dart';

class DeleteResponse extends BaseOneResponse {
  const DeleteResponse({
    super.status,
    List<dynamic>? super.data,
    super.message,
  });

  factory DeleteResponse.fromJson(Map<String, dynamic> json) => DeleteResponse(
        data: json['data'],
        message: json['message'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'data': data,
        'message': message,
        'status': status,
      };
}
