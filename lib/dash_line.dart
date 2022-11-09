import 'package:dash_line/dash_painter.dart';
import 'package:flutter/material.dart';

class DashLine extends StatefulWidget {
  const DashLine({Key? key}) : super(key: key);

  @override
  _DashLineState createState() => _DashLineState();
}

class _DashLineState extends State<DashLine> {
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
        title: const Text("Line Demo"),
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
