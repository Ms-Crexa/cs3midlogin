import 'package:flutter/material.dart';
import 'Components/button.dart';
import 'Components/card.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  _LandingpageState createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  bool isSignUpVisible = false;
  bool isSignInVisible = false;

  void toggleSignUpCard() {
    setState(() {
      isSignUpVisible = true;
      isSignInVisible = false;
    });
  }

  void toggleSignInCard() {
    setState(() {
      isSignInVisible = true;
      isSignUpVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgimage.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(
                left: isMobile ? 50 : 90,
                top: isMobile ? 100 : 60,
                right: isMobile ? 50 : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/AppLogo.png',
                    height: isMobile ? 80 : 150,
                    width: isMobile ? 80 : 150,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: isMobile ? 220 : double.infinity,
                    child: Text(
                      'Enjoy the trip with me',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: isMobile ? 35 : 66,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? screenHeight * 0.35 : 90),
                  Center(
                    child: Column(
                      children: [
                        customelvatedButton(
                          text: 'Sign up',
                          width: 340,
                          backgroundColor:
                              const Color.fromARGB(255, 252, 135, 32),
                          textColor: const Color.fromARGB(255, 255, 255, 255),
                          onPressed: isMobile
                              ? toggleSignUpCard
                              : () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                        ),
                        const SizedBox(height: 25),
                        customelvatedButton(
                          text: 'Sign in',
                          width: 340,
                          backgroundColor:
                              const Color.fromARGB(255, 248, 248, 248),
                          textColor: const Color.fromARGB(255, 252, 135, 3),
                          onPressed: isMobile
                              ? toggleSignInCard
                              : () {
                                  Navigator.pushNamed(context, '/signin');
                                },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSignUpVisible)
            card(
              content: signUpContent(),
            )
          else if (isSignInVisible)
            card(content: signInContent()),
        ],
      ),
    );
  }
}
