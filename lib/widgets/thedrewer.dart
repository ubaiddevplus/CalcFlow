import 'package:flutter/material.dart';

class TheDrawer extends StatefulWidget {
  const TheDrawer({super.key});

  @override
  State<TheDrawer> createState() => _TheDrawerState();
}

class _TheDrawerState extends State<TheDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Container(
          color: Colors.black87,
          child: SafeArea(
            child: Column(
              children: [
                ListTile(
                  title: Text("History"),
                  leading: Icon(Icons.history, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
