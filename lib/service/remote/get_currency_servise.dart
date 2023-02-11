import 'package:app/models/news_model.dart';
import 'package:dio/dio.dart';

class GetNewscyService {
  Future<dynamic> getCyrrency() async {
    try {
      Response response = await Dio(BaseOptions(
        validateStatus: (status) {
          if (status! >= 100 && status <= 599) {
            return true;
          } else {
            return false;
          }
        },
      )).get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => NewsModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
