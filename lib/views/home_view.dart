import 'package:flutter/material.dart';
import 'calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: CalculatorView(),
        ),
      ),
    );
  }
}
