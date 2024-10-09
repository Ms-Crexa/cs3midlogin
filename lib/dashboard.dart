import 'package:cs3midlogin/models/products.dart';
import 'package:cs3midlogin/services/apiproducts.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _dashboardState();
}

// ignore: camel_case_types
class _dashboardState extends State<Dashboard> {
  List<Products> allProducts = [];
  @override
  void initState() {
    super.initState();

    loadProducts();
  }

  loadProducts() async {
    List<Products> meals = await MealApi().getFilipinoAPI();
    setState(() {
      allProducts = meals;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(allProducts.length);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            direction: Axis.horizontal,
            children: allProducts.map((oneMeal) {
              return Card(
                  child: Column(
                children: [
                  SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.network(oneMeal.image)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(oneMeal.title),
                  ),
                ],
              ));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
