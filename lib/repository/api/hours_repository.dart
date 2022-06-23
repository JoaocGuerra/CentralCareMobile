import 'package:dio/dio.dart';

import '../../constants/constants_api.dart';

class HoursRepository {
  final _dio = Dio();

  Future<List<dynamic>> fetchHoursDoctor(String doctor, String date) async {
    try {
      final response = await _dio
          .get(pathLocal + pathAvailableTimes + '/' + doctor + '/' + date);
      final responseBody = Map<String, dynamic>.from(response.data);
      return responseBody['horarios_disponiveis'];
    } catch (e) {
      return Future.error('Erros: HoursRepository');
    }
  }
}
