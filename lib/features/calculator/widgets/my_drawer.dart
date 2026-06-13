import 'package:flutter/material.dart';
import 'package:calcflow/core/constants/app_colors.dart';

class TheDrawer extends StatefulWidget {
  final List<String> history;
  const TheDrawer({super.key, required this.history});

  @override
  State<TheDrawer> createState() => _TheDrawerState();
}

class _TheDrawerState extends State<TheDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Container(
          color: AppColors.background,
          child: SafeArea(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "History",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Icon(Icons.history, color: Colors.white),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.history.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          widget.history[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
