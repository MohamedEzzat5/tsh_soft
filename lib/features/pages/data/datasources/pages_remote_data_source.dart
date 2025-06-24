import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/params/page_params.dart';
import 'package:tsh_soft/features/pages/data/models/page_resp_model.dart';
import 'package:tsh_soft/injection_container.dart';

abstract class PagesRemoteDataSource {
  Future<GetPageRespModel> getPage({required PageParams params});
}

class PagesRemoteDataSourceImpl extends PagesRemoteDataSource {
  @override
  Future<GetPageRespModel> getPage({required PageParams params}) async {
    try {
      final response = await dioConsumer.get('/pages/${params.slug}');
      if (response['status'] == true) {
        return GetPageRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }
}
