import 'package:dio/dio.dart';

const mealdb = "https://www.themealdb.com/api/json/v1/1/filter.php?a=Filipino";
final dio = Dio();

getMeal() async {
  try {
    final response = await dio.get(mealdb);
    return response;
  } catch (e) {
    print('Error');
  }
}
