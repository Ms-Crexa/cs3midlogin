import 'package:dio/dio.dart';
import '../models/products.dart';

class MealApi {
  final baseURL = "https://fakestoreapi.com/products";
  final dio = Dio();

  getproductsAPI() async {
    Response response = await dio.get(
      baseURL,
    );

    List<Products> allProducts = [];
    try {
      if (response.statusCode == 200) {
        for (var i = 0; i < response.data.length; i++) {
          String idd = (response.data[i]["id"].toString());
          String namee = (response.data[i]["title"].toString());
          String urlImagee = (response.data[i]["image"].toString());
          String pricee = (response.data[i]["price"].toString());
          String categ = (response.data[i]["category"].toString());
          String desc = (response.data[i]["description"].toString());
          String ratee = (response.data[i]["rating"]["rate"].toString());
          String countt = (response.data[i]["rating"]["count"].toString());

          Products oneProducts = Products(
              id: idd,
              title: namee,
              image: urlImagee,
              price: pricee,
              category: categ,
              rate: ratee,
              count: countt,
              description: desc);
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
