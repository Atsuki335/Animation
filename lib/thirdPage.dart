import 'package:flutter/material.dart';

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

class _Animation3State extends State<Animation3>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 1.0, end: 2.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  controller.forward();
                },
                icon: Icon(Icons.play_arrow)),
            IconButton(
              onPressed: () {
                controller.stop();
              },
              icon: Icon(Icons.stop),
            ),
            IconButton(
                onPressed: () {
                  controller.repeat();
                },
                icon: Icon(Icons.loop))
          ],
        )),
        body: Center(
          child: ScaleTransition(
              scale: animation,
              child: CustomPaint(
                painter: CatPainter(),
                child: Container(),
              )),
        ));
  }
}

class CatPainter extends CustomPainter {
  final kColor = Color.fromARGB(255, 81, 75, 75);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // 猫の顔 (中央の大きな円)
    paint.color = kColor;
    var center = Offset(size.width / 2, size.height / 2);
    Rect rect = Rect.fromCenter(center: center, width: 100.0, height: 77.0);
    canvas.drawOval(rect, paint);

    // 猫の耳 (三角形)
    paint.color = kColor;
    var path = Path();
    path.moveTo(size.width / 2 - 44.0, size.height / 2 - 53.0); // 左耳の頂点
    path.lineTo(size.width / 2 - 15.0, size.height / 2 - 35.0); // 左耳の下側
    path.lineTo(size.width / 2 - 48.0, size.height / 2 - 10.0); // 左耳の上側
    path.close();
    //(x座標,y座標)
    canvas.drawPath(path, paint); // 左耳を描く

    path = Path();
    path.moveTo(size.width / 2 + 44.0, size.height / 2 - 53.0); // 右耳の頂点
    path.lineTo(size.width / 2 + 15.0, size.height / 2 - 35.0); // 右耳の下側
    path.lineTo(size.width / 2 + 48.0, size.height / 2 - 10.0); // 右耳の上側
    path.close();
    canvas.drawPath(path, paint); // 右耳を描く

    // 猫の髭 (直線)
    paint.color = kColor;
    paint.strokeWidth = 2;
    canvas.drawLine(Offset(size.width / 2 - 66.0, size.height / 2 - 8.0),
        Offset(size.width / 2 - 40.0, size.height / 2 - 5.0), paint); // 左上
    canvas.drawLine(Offset(size.width / 2 - 66.0, size.height / 2 + 8.0),
        Offset(size.width / 2 - 40.0, size.height / 2 + 5.0), paint); // 左中

    canvas.drawLine(Offset(size.width / 2 + 66.0, size.height / 2 - 8.0),
        Offset(size.width / 2 + 40.0, size.height / 2 - 5.0), paint); // 右上
    canvas.drawLine(Offset(size.width / 2 + 66.0, size.height / 2 + 8.0),
        Offset(size.width / 2 + 40.0, size.height / 2 + 5.0), paint); // 右中
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
