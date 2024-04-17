import 'package:dio/dio.dart';
import 'package:tw_global/domain/model/pixabay_model.dart';
import 'package:tw_global/utils/app_endpoints.dart';

class ApiService {

  final Dio _dio = Dio();

  Future<List<PixabayModel>> fetchImages() async {
    try {
      final response = await _dio.get(AppEndPoints.fetchImages);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['hits'];
        return responseData.map((json) => PixabayModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      throw Exception('Failed to load images $e');
    }
  }
}