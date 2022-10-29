import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home: const Calulator(),
    );
  }
}

class Calulator extends StatefulWidget {
  const Calulator({Key? key}) : super(key: key);

  @override
  State<Calulator> createState() => _CalulatorState();
}

class _CalulatorState extends State<Calulator> {
  String textdisplay = "";
  btnOnClick(btnVal) {
    print(btnVal);
    setState(() {});
    textdisplay += btnVal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 20,
              color: Colors.amber,
            ),
            Container(
              height: 200,
              width: double.maxFinite,
              color: Colors.blue[200],
              child: SingleChildScrollView(
                child: Text(
                  textdisplay,
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: CalculatorButton(
                    btntext: "AC",
                    callBack: btnOnClick,
                  ),
                ),
                Container(
                  child: CalculatorButton(
                    btntext: "C",
                    callBack: btnOnClick,
                  ),
                ),
                Container(
                  child: CalculatorButton(
                    btntext: "DEL",
                    callBack: btnOnClick,
                  ),
                ),
                Container(
                  child: CalculatorButton(
                    btntext: "%",
                    callBack: btnOnClick,
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //     Container(
            //       child: const CalculatorButton(),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatefulWidget {
  String btntext;
  Function callBack;
  CalculatorButton({required this.btntext, required this.callBack});

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    bool onclick = false;
    return GestureDetector(
      onTap: () {
        widget.callBack(widget.btntext);
        setState(() {
          onclick = true;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: onclick ? Colors.cyan[400] : Colors.amber[300],
          shape: onclick ? BoxShape.circle : BoxShape.rectangle,
        ),
        // ignore: prefer_const_constructors
        child: Text(
          widget.btntext,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
