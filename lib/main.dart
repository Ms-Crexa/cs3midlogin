import 'package:flutter/material.dart';
import 'Landingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Landingpage(),
      // routes: {
      //   '/signup': (context) => SignUpPage(),
      //   '/signin': (context) => SignInPage(),
      // },
    );
  }
}
