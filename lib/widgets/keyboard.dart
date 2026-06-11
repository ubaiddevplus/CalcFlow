import 'package:CalcFlow/widgets/calculator_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Keyboard extends StatelessWidget {
  final Function(String) onBtnPressed;
  final List<String> buttons = [
    "C",
    "( )",
    "%",
    "÷",
    "7",
    "8",
    "9",
    "✕",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "+/-",
    "0",
    ".",
    "=",
  ];
  final List<IconData> operationIcons = [
    CupertinoIcons.divide,
    CupertinoIcons.multiply,
    Icons.remove,
    Icons.add,
    CupertinoIcons.equal,
  ];
  Keyboard({super.key, required this.onBtnPressed});

  void onPress(String value) {
    HapticFeedback.selectionClick();
    onBtnPressed(value);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        String btnText = buttons[index];
        return CalculatorButton(
          text: btnText,
          bgColor: _getBtnColor(btnText),
          onTap: () => onPress(btnText),
        );
      },
    );
  }
}

Color _getBtnColor(String btnText) {
  if (["÷", "✕", "-", "+", "( )", "C", "%"].contains(btnText)) {
    return Colors.blueGrey;
  } else if (btnText == "=") {
    return Colors.green;
  } else {
    return Colors.grey[850]!;
  }
}
