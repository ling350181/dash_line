import 'package:dash_line/dash_painter.dart';
import 'package:flutter/material.dart';

class DashRound extends StatefulWidget {
  const DashRound({Key? key}) : super(key: key);

  @override
  _DashRoundState createState() => _DashRoundState();
}

class _DashRoundState extends State<DashRound> {
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey[200],
            height: 500,
            width: 360,
            child: CustomPaint(
              painter: DashPainter(step: 20, span: 7),
            ),
          ),
        ],
      ),
    );
  }
}
