import 'package:flutter/material.dart';
import 'widgets/keyboard.dart';
import 'widgets/mytextfield.dart';
import 'widgets/calculator_logic.dart';
import 'widgets/buttons.dart';

void main() {
  runApp(const MyApp());
}

class ColoredExpressionController extends TextEditingController {
  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    List<TextSpan> spans = [];
    String text = this.text;
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (char == '+' || char == '-' || char == '✕' || char == '÷') {
        spans.add(
          TextSpan(
            text: char,
            style: TextStyle(color: Colors.green, fontSize: 48),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: char,
            style: TextStyle(color: Colors.white, fontSize: 48),
          ),
        );
      }
    }
    return TextSpan(children: spans);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CalculatorScreen());
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final controller = ColoredExpressionController()..text = "0";

  String expression = "";
  String result = "";
  List<String> operators = ["C", "÷", "✕", "-", "+", "="];
  void handleButtonPress(String btntext) {
    setState(() {
      if (controller.text == "0" &&
          !operators.contains(btntext) &&
          btntext != "delete" &&
          btntext != "%" &&
          btntext != "+/-" &&
          btntext != "( )") {
        controller.text = btntext;
      } else {
        if (btntext == "C") {
          controller.text = "0";
          result = "";
        } else if (btntext == "( )") {
          String text = controller.text;
          int openCont = text.split("(").length - 1;
          int closeCont = text.split(")").length - 1;
          String lastChar = text[text.length - 1];
          if (text == "0" ||
              operators.contains(lastChar) ||
              openCont == closeCont) {
            controller.text = "$text(";
          } else {
            controller.text = "$text)";
          }
        } else if (btntext == "+/-") {
          if (controller.text == "0") {
            controller.text = "(-";
          } else if (controller.text == "(-") {
            controller.text = "0";
          } else if (controller.text.startsWith("(-")) {
            controller.text = controller.text.substring(2);
          } else {
            controller.text = "(-${controller.text}";
          }
        } else if (btntext == "%") {
          if (controller.text == "0") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Invalid format used.",
                  textAlign: TextAlign.center,
                ),
                duration: Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(25),
                ),
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.4,
                  left: 50,
                  right: 50,
                ),
              ),
            );
            return;
          } else {
            controller.text += btntext;
          }
        } else if (btntext == "=") {
          if (!operators.contains(
            controller.text[controller.text.length - 1],
          )) {
            controller.text = CalculatorLogic.calculateResult(controller.text);
            result = "";
          } else {
            debugPrint("last char is an operator");
          }
        } else {
          if (operators.contains(controller.text[controller.text.length - 1]) &&
              operators.contains(btntext)) {
            debugPrint("last char is an operator");
          } else if (btntext == "delete") {
            if (controller.text.length > 1) {
              controller.text = controller.text.substring(
                0,
                controller.text.length - 1,
              );
            } else {
              controller.text = "0";
            }
          } else {
            controller.text += btntext;

            debugPrint("btn text: $btntext  look at here: $controller.text");
            debugPrint("display text: $controller.text");
            if (!operators.contains(
              controller.text[controller.text.length - 1],
            )) {
              result = CalculatorLogic.calculateResult(controller.text);
              debugPrint("btn text: $btntext  look at here: $controller.text");
              debugPrint("display text: $controller.text");
            } else {
              result = "";
              debugPrint("last char is an operator");
            }
          }
        }
      }
      debugPrint("result: $result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: MyTextField(
                controller: controller,
                totalToDisplay: result,
              ),
            ),
            Expanded(flex: 2, child: MyDisplayTotal(totalToDisplay: result)),
            Expanded(
              flex: 1,
              child: Buttons(
                onBtnPressed: handleButtonPress,
                backspace: controller.text.isNotEmpty,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(flex: 9, child: Keyboard(onBtnPressed: handleButtonPress)),
          ],
        ),
      ),
    );
  }
}
