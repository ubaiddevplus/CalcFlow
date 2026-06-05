import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String totalToDisplay;

  MyTextField({
    super.key,
    required this.totalToDisplay,
    required this.controller,
  });

  void textToTextField(String value) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                TextField(
                  controller: controller,
                  readOnly: true,
                  showCursor: true,
                  autofocus: true,
                  maxLines: null,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 48, color: Colors.white),
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyDisplayTotal extends StatefulWidget {
  final String totalToDisplay;
  const MyDisplayTotal({super.key, required this.totalToDisplay});

  @override
  State<MyDisplayTotal> createState() => _MyDisplayTotalState();
}

class _MyDisplayTotalState extends State<MyDisplayTotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  widget.totalToDisplay,
                  //maxLines: 2,
                  //overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
