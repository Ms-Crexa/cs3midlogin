import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'button.dart';

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
          content: _isSignUp ? signUpContent() : signInContent(),
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

Widget signUpContent() {
  return Container(
    margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
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
                        width: 1),
                  ),
                  padding: EdgeInsets.all(15), // Adds space around the icon
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Upload picture',
                  style: TextStyle(color: Colors.black38),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 30,
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
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 252, 135, 32)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Username',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                prefixIcon: Icon(LineAwesomeIcons.user),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 252, 135, 32)),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 252, 135, 32)),
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
                  'https://scontent.fmnl30-3.fna.fbcdn.net/v/t39.30808-6/399543211_3670547096562585_5563194013656782381_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeEdJuMVGWxnZODq8rjbhEfw5KUyFed1F-LkpTIV53UX4nQNrTyVcy6UpNgdWtBsiPjHYjW5bZY95NRyVafEh7Ld&_nc_ohc=c6LVat6zUawQ7kNvgGQ3vxe&_nc_ht=scontent.fmnl30-3.fna&_nc_gid=ARf7D-7BFCuVXabktp1juGz&oh=00_AYDTRQp47pEZ2akm32i57R4ighyuISyvD2So28L18sOcsg&oe=66F837ED'),
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
              height: 20,
            ),
            const Text('or sign in with'),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.network(
                      'https://cdn-icons-png.freepik.com/256/16509/16509564.png?semt=ais_hybrid',
                      height: 40,
                      width: 40,
                    )),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQKrFhY-ljA-u7J5IMWeTv8zmpBx4PP9nQMw&s',
                      height: 30,
                      width: 30,
                    )),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI-h-e2hgz8mwGfCt4gvj4IgMG_wAUolVM6w&s',
                      height: 30,
                      width: 40,
                    )),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
