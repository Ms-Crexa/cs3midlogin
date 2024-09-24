import 'package:flutter/material.dart';
import 'package:cs3midlogin/Components/card.dart'; // Assuming 'card' is your custom widget

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 600;

    return Scaffold(
      body: isMobile
          ? Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/bgimage.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: Card(
                          color: Colors.white.withOpacity(0.8),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Welcome to the App!',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Form section
                Expanded(
                  child: Expanded(
                    child: card(content: signUpContent()),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/bgimage.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: Card(
                          color: Colors.white.withOpacity(0.8),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Welcome to the App!',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Form section
                Expanded(
                  child: card(
                    content: signUpContent(),
                  ),
                )
              ],
            ),
    );
  }
}
