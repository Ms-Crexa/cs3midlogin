import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'button.dart';
import 'icon_button.dart';

class CardSwitcher extends StatefulWidget {
  const CardSwitcher({super.key});

  @override
  _CardSwitcherState createState() => _CardSwitcherState();
}

class _CardSwitcherState extends State<CardSwitcher> {
  bool _isSignUp = true;

  void _toggleCard() {
    setState(() {
      _isSignUp = !_isSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: card(
          isVisible: true,
          offsetAnimation: AlwaysStoppedAnimation(10 as Offset),
          content: _isSignUp ? signUpContent() : signInContent(),
        ),
      ),
    );
  }
}

Widget card({
  required bool isVisible,
  required Animation<Offset> offsetAnimation,
  required Widget content,
}) {
  if (!isVisible) return const SizedBox.shrink();

  return SlideTransition(
    position: offsetAnimation,
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 540,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: content,
          ),
        ),
      ),
    ),
  );
}

Widget signUpContent() {
  return Container(
    margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
    child: Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Account',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            Column(
              children: [Icon(Icons.camera), Text('Upload Photo')],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                prefixIcon: Icon(LineAwesomeIcons.envelope),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Username',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                prefixIcon: Icon(LineAwesomeIcons.user),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Password',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(LineAwesomeIcons.key_solid),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 45),
            Center(
              child: customelvatedButton(
                text: 'Sign up',
                width: 340,
                backgroundColor: const Color.fromARGB(255, 252, 135, 32),
                textColor: const Color.fromARGB(255, 255, 255, 255),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget signInContent() {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 230,
              child: const Text(
                'Welcome Back Alice',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
              ),
            ),
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
            ),
          ],
        ),
        const SizedBox(height: 45),
        const Text('Password',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(LineAwesomeIcons.key_solid),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        const SizedBox(height: 45),
        Column(
          children: [
            customelvatedButton(
              text: 'Sign in',
              width: 340,
              backgroundColor: const Color.fromARGB(255, 252, 135, 32),
              textColor: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                customIconButton(
                  onPressed: () {},
                  imagePath:
                      'https://upload.wikimedia.org/wikipedia/commons/4/4e/Google_Logo.svg', // Example Google icon
                )
              ],
            )
          ],
        ),
      ],
    ),
  );
}
