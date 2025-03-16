import 'package:dio/dio.dart';
import 'package:my_flutter_bloc/constants/api_constants.dart';

class ApiService {
  late Dio dio;

  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(milliseconds: 20 * 1000),
      receiveTimeout: Duration(milliseconds: 20 * 1000),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
