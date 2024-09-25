import 'package:flutter/material.dart';
import 'Landingpage.dart';
import 'package:cs3midlogin/sign_in_page.dart';
import 'package:cs3midlogin/sign_up_page.dart';
import 'package:cs3midlogin/dashboard.dart';

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
      initialRoute: '/',
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/signin': (context) => const SignInPage(),
        '/Dashboard': (context) => const Dashboard(),
      },
    );
  }
}
