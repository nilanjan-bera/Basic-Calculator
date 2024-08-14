import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      // onExitRequested: _onExitRequested,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChanged,
    );
  }

  void _onShow() => print("onShow called");
  void _onHide() => print("onHide called");
  void _onResume() => print("onResume called");
  void _onDetach() => print("onDetach called");
  void _onInactive() => print("onInactive called");
  void _onPause() => print("onPause called");
  void _onRestart() => print("onRestart called");
  void _onStateChanged(AppLifecycleState state) {
    print("onStateChanged called with state : $state");
  }

  @override
  void dispose() {
    displayTwoController.dispose();
    displayOneController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          //   Calculator Display
          CalculatorDisplay(
            hint: "Enter First Number",
            controller: displayOneController,
          ),
          SizedBox(
            height: 30,
          ),
          CalculatorDisplay(
            hint: "Enter Second Number",
            controller: displayTwoController,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            z.toString(),
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! -
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! /
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.divide),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    x = 0;
                    y = 0;
                    z = 0;
                    displayOneController.clear();
                    displayTwoController.clear();
                  });
                },
                child: Text("Clear"),
              )
            ],
          ),

          // const SizedBox(height: 15,),
          // FloatingActionButton.extended(
          //   onPressed: (){
          //   setState(() {
          //     x=0;
          //     y=0;
          //     z=0;
          //     displayOneController.clear();
          //     displayTwoController.clear();
          //   });
          //
          //   },
          //   label: Text("Clear"),
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay(
      {super.key, this.hint = "Enter a number", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white)),

      //   expand
      //
      //
    );
  }
}
