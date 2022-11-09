import 'package:dash_line/dash_decoration.dart';
import 'package:flutter/material.dart';

class DashBorder extends StatefulWidget {
  const DashBorder({Key? key}) : super(key: key);

  @override
  _DashBorderState createState() => _DashBorderState();
}

class _DashBorderState extends State<DashBorder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Dash Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const DashDecoration(
                  pointWidth: 2,
                  step: 20,
                  radius: Radius.circular(15),
                  gradient: SweepGradient(
                    colors: [
                      Colors.blue,
                      Colors.red,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.orangeAccent,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
