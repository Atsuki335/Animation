import 'package:flutter/material.dart';
import 'main.dart';
import 'firstPage.dart';
import 'thirdPage.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecondPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Animation2(),
      ),
    );
  }
}

class Animation2 extends StatefulWidget {
  @override
  State<Animation2> createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> {
  double width = 50;
  IconData icon = Icons.play_arrow;
  bool isPressedOnce = false;

  void PressedOnce() {
    setState(() {
      width = 200;
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
      width = 50;
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
          child: Icon(icon),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: width,
              height: 100,
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
                    MaterialPageRoute(builder: (context) => ThirdPage()));
              },
            ),
          ]),
        ));
  }
}
