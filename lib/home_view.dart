import 'package:flutter/material.dart';

class Animated3DCard extends StatefulWidget {
  @override
  _Animated3DCardState createState() => _Animated3DCardState();
}

class _Animated3DCardState extends State<Animated3DCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double _angleX = 0;
  double _angleY = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _angleY += details.delta.dx * 0.01;
      _angleX -= details.delta.dy * 0.01;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _angleX = 0;
      _angleY = 0;
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective
              ..rotateX(_angleX)
              ..rotateY(_angleY),
            child: child,
          );
        },
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Colors.lightBlue, Colors.limeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              //
              //
              //child: Text(
              //   "3D Card",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              child: Image.asset("assets/pic.png"),
            ),
          ),
        ),
      ),
    );
  }
}
