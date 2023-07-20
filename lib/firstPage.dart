import 'package:flutter/material.dart';
import 'main.dart';
import 'secondPage.dart';

void main() {
  runApp(FirstPage());
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Animation1());
  }
}

class Animation1 extends StatefulWidget {
  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> {
  double size = 100;
  IconData icon = Icons.play_arrow;
  bool isPressedOnce = false;

  void PressedOnce() {
    setState(() {
      size = 200;
    });
    Future.delayed(
      const Duration(milliseconds: 1400),
      () {
        setState(() {
          icon = Icons.replay;
        });
      },
    );
  }

  void initializePage() {
    setState(() {
      icon = Icons.play_arrow;
      size = 100;
      isPressedOnce = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (!isPressedOnce) {
                PressedOnce();
                isPressedOnce = true;
              } else {
                initializePage();
              }
            },
            child: Icon(icon)),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            width: size,
            height: size,
            color: Colors.blue,
          ),
          ElevatedButton(
            child: const Text(
              'Next',
              style: TextStyle(color: Color.fromARGB(255, 9, 46, 81)),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.blueAccent,
              backgroundColor: Colors.grey[300],
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage()));
            },
          ),
        ])));
  }
}
