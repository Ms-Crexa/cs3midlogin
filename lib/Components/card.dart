import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:cs3midlogin/Components/button.dart';

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
          content: _isSignUp ? signUpContent(context) : signInContent(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleCard,
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}

Widget card({
  required bool isVisible,
  required Widget content,
}) {
  if (!isVisible) return const SizedBox.shrink();

  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: double.infinity,
      height: 580,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: content,
      ),
    ),
  );
}

Widget signUpContent(BuildContext context) {
  return SingleChildScrollView(
    child: Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 120,
                child: Text(
                  'New Account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 252, 135, 32),
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Upload picture',
                    style: TextStyle(color: Colors.black38),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Firstname',
                  style: TextStyle(color: Colors.black, fontSize: 13)),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.person_2_outlined),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 252, 135, 32)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Lastname',
                  style: TextStyle(color: Colors.black, fontSize: 13)),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.person_3_outlined),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 252, 135, 32)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Email',
                  style: TextStyle(color: Colors.black, fontSize: 13)),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(LineAwesomeIcons.envelope),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 252, 135, 32)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Username',
                  style: TextStyle(color: Colors.black, fontSize: 13)),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(LineAwesomeIcons.user),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 252, 135, 32)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Password',
                  style: TextStyle(color: Colors.black, fontSize: 13)),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(LineAwesomeIcons.key_solid),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 252, 135, 32)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Confirm Password',
                  style: TextStyle(color: Colors.black, fontSize: 13)),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key_off),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 252, 135, 32)),
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Center(
                child: customelvatedButton(
                  text: 'Sign up',
                  width: 340,
                  backgroundColor: const Color.fromARGB(255, 252, 135, 32),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/Dashboard');
                  },
                ),
              ),
              const SizedBox(height: 45),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget signInContent(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 230,
              child: Text(
                'Welcome Back Alice',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
              ),
            ),
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/550x/64/fb/7b/64fb7b55c1cf8437405f4b53f541d07a.jpg',
              ),
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
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot password',
            style: TextStyle(color: Color.fromARGB(255, 252, 135, 32)),
          ),
        ),
        const SizedBox(height: 45),
        Column(
          children: [
            customelvatedButton(
              text: 'Sign in',
              width: 340,
              backgroundColor: const Color.fromARGB(255, 252, 135, 32),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/Dashboard');
              },
            ),
          ],
        ),
        const SizedBox(height: 45),
      ],
    ),
  );
}
