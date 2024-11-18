import 'package:card_animation/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("3D Animated Card"),
        ),
        body: Center(
          child: Animated3DCard(),
        ),
      ),
    );
  }
}





// Explanation of the Code:
// GestureDetector: Detects drag movements, which update the rotation angles.
// Transform and Matrix4: Applies 3D transformations to the card based on user drag, giving it a 3D rotation.
// AnimationController: Resets the card to its original position smoothly when dragging ends.
// Features:
// The card rotates based on user drag.
// Smooth reset to the default position when the user releases the card.