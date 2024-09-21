import 'package:flutter/material.dart';
import 'Components/button.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({Key? key}) : super(key: key);

  @override
  _LandingpageState createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;
    // Check if screen is mobile or larger
    final isMobile = screenWidth < 600;

    return Scaffold(
      body: Container(
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://www.shutterstock.com/image-photo/colorful-sunset-viewed-pink-sea-600nw-2239509385.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin:
              EdgeInsets.only(left: isMobile ? 20 : 0, top: isMobile ? 50 : 0),
          child: Column(
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            mainAxisAlignment:
                !isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/AppLogo.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Enjoy the trip with me',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: isMobile ? 18 : 36,
                ),
              ),
              SizedBox(
                height: isMobile ? 60 : 40,
              ),
              customelvatedButton(
                text: 'Signup',
                backgroundColor: Colors.black,
                textColor: const Color.fromARGB(137, 255, 255, 255),
                onPressed: () {},
              ),
              SizedBox(
                height: 10,
              ),
              customelvatedButton(
                text: 'SignIn',
                backgroundColor: Colors.black,
                textColor: const Color.fromARGB(234, 255, 255, 255),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
