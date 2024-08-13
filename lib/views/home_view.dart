import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        color: Colors.deepOrange,
        child: Center(child: Text("Hello World",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white
          )
          ,)),
      ),
    );
  }
}
