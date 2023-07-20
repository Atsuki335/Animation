import 'package:flutter/material.dart';
import 'main.dart';
import 'secondPage.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecondPage',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Animation3(),
      ),
    );
  }
}

class Animation3 extends StatefulWidget {
  @override
  State<Animation3> createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
