import 'package:flutter/material.dart';
import 'Components/button.dart';
import 'Components/card.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  _LandingpageState createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetSignUpAnimation;
  late Animation<Offset> _offsetSignInAnimation;
  bool isSignUpVisible = false;
  bool isSignInVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Initialize animations
    _offsetSignUpAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _offsetSignInAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void toggleSignUpCard() {
    setState(() {
      isSignUpVisible = !isSignUpVisible;
      isSignInVisible = false;
    });
    isSignUpVisible ? _controller.forward() : _controller.reverse();
  }

  void toggleSignInCard() {
    setState(() {
      isSignInVisible = !isSignInVisible;
      isSignUpVisible = false;
    });
    isSignInVisible ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenheight,
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
                  right: isMobile ? 50 : 0),
              child: Column(
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.start,
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
                  SizedBox(height: isMobile ? screenheight * 0.35 : 90),
                  Center(
                    child: Column(
                      children: [
                        customelvatedButton(
                          text: 'Sign up',
                          width: 340,
                          backgroundColor:
                              const Color.fromARGB(255, 252, 135, 32),
                          textColor: const Color.fromARGB(255, 255, 255, 255),
                          onPressed: toggleSignUpCard,
                        ),
                        const SizedBox(height: 25),
                        customelvatedButton(
                          text: 'Sign in',
                          width: 340,
                          backgroundColor:
                              const Color.fromARGB(255, 248, 248, 248),
                          textColor: const Color.fromARGB(255, 252, 135, 3),
                          onPressed: toggleSignInCard,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Ternary rendering for cards
          isSignUpVisible
              ? card(
                  isVisible: true,
                  offsetAnimation: _offsetSignUpAnimation,
                  content: signUpContent(),
                )
              : isSignInVisible
                  ? card(
                      isVisible: true,
                      offsetAnimation: _offsetSignInAnimation,
                      content: signInContent(),
                    )
                  : const SizedBox.shrink(), // Fallback if neither is visible
        ],
      ),
    );
  }
}
