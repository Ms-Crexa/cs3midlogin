import 'package:cs3midlogin/services/apimeal.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> meals = [];

  @override
  void initState() {
    super.initState();

    getDio();
  }

  void getDio() async {
    var response = await getMeal();
    print(response.data['meals']);
    setState(() {
      meals = response.data['meals'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var meal in meals)
              Card(
                child: Column(
                  children: [
                    Image.network(meal['strMealThumb']), // Meal thumbnail
                    const SizedBox(height: 10), // Some spacing
                    Text(meal['strMeal']), // Meal name
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
