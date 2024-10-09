import 'package:dio/dio.dart';
import '../models/products.dart';

class MealApi {
  final baseURL = "https://fakestoreapi.com/products";
  final dio = Dio();

  getFilipinoAPI() async {
    Response response = await dio.get(
      baseURL,
      queryParameters: {'a': 'Filipino'},
    );

    List<Products> allProducts = [];
    try {
      if (response.statusCode == 200) {
        for (var i = 0; i < response.data.length; i++) {
          String idd = (response.data[i]["id"].toString());
          String namee = (response.data[i]["title"].toString());
          String urlImagee = (response.data[i]["image"].toString());

          Products oneProducts =
              Products(id: idd, title: namee, image: urlImagee);
          // print(oneProducts.toString());
          allProducts.add(oneProducts);
        }
        print(allProducts[0].id);
      } else {}
    } catch (ex) {
      print(ex.toString());
    }
    return allProducts;
  }
}
