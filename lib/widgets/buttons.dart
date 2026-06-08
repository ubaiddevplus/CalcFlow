import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  final Function(String) onBtnPressed;
  final bool backspace;
  final VoidCallback onhistoryPressed;
  const Buttons({
    super.key,
    required this.onBtnPressed,
    required this.backspace,
    required this.onhistoryPressed,
  });

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,

        //borderRadius: BorderRadius.circular(15),
        border: Border(
          bottom: BorderSide(color: Colors.grey[800]!, width: 1.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
        child: Row(
          children: [
            IconButton(onPressed: widget.onhistoryPressed, icon: Icon(Icons.access_time)),
            IconButton(onPressed: () {}, icon: Icon(Icons.linear_scale)),
            IconButton(onPressed: () {}, icon: Icon(Icons.calculate_outlined)),
            const Spacer(),
            IconButton(
              onPressed: () => widget.onBtnPressed("delete"),
              icon: Icon(
                Icons.backspace_outlined,
                color: widget.backspace ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
