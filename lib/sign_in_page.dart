import 'package:flutter/material.dart';
import 'package:cs3midlogin/Components/card.dart'; // Assuming 'card' is your custom widget

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;

    // Define a breakpoint for responsiveness (e.g., 600 pixels)
    bool isMobile = screenWidth < 600;

    return Scaffold(
      body: isMobile
          ? Column(
              // Stack the image and form vertically for mobile
              children: [
                // Image section
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign Up',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                // Handle sign-up logic here
                              },
                              child: const Text('Sign Up'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              // Display image and form side by side for larger screens
              children: [
                // Image section
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
                Expanded(child: card(content: signInContent())),
              ],
            ),
    );
  }
}
