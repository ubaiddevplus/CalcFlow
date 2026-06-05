import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Keyboard extends StatelessWidget {
  final Function(String) onBtnPressed;
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
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              for (var btntext in ["C", "7", "4", "1", "+/-"])
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: ElevatedButton(
                        onPressed: () => onPress(btntext),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: btntext == "C"
                              ? const Color.fromARGB(255, 75, 74, 74)
                              : const Color.fromARGB(255, 44, 34, 34),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            btntext,
                            style: btntext != "+/-"
                                ? const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'sans-serif',
                                    color: Colors.white,
                                  )
                                : const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'sans-serif',
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        Expanded(
          child: Column(
            children: [
              for (var btntext in ["( )", "8", "5", "2", "0"])
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),

                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: ElevatedButton(
                        onPressed: () => onPress(btntext),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: btntext == "( )"
                              ? const Color.fromARGB(255, 75, 74, 74)
                              : const Color.fromARGB(255, 44, 34, 34),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              btntext,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'sans-serif',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              for (var btntext in ["%", "9", "6", "3", "."])
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),

                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: ElevatedButton(
                        onPressed: () => onPress(btntext),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: btntext == "%"
                              ? const Color.fromARGB(255, 75, 74, 74)
                              : const Color.fromARGB(255, 44, 34, 34),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            btntext,
                            style: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'sans-serif',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        Expanded(
          child: Column(
            children: [
              for (int i = 0; i < operationIcons.length; i++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),

                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: ElevatedButton(
                        onPressed: () {
                          List<String> opTexts = ["÷", "✕", "-", "+", "="];
                          onPress(opTexts[i]);
                        },

                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: i == 4
                              ? const Color.fromARGB(230, 151, 197, 11)
                              : const Color.fromARGB(255, 150, 136, 136),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(
                            operationIcons[i],
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
