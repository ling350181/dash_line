import 'dart:ui';

import 'package:flutter/material.dart';

class DashPainter extends CustomPainter {
  final double step;
  final double span;

  DashPainter({
    this.step = 2,
    this.span = 2,
  });

  double get partLength => step + span;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 2;

    Path path = Path();
    path.moveTo(-100, 0);
    path.lineTo(100, 0);
    //path = dashPath(path);
    paintDash(canvas, path, paint);

    //canvas.drawPath(path, paint);
  }

  Path dashPath(Path source) {
    final PathMetrics pms = source.computeMetrics();
    final Path dest = Path();
    for (var pm in pms) {
      // 破線組合せセットの数
      final int count = pm.length ~/ partLength;
      for (int i = 0; i < count; i++) {
        // 実践部分
        dest.addPath(pm.extractPath(partLength * i, partLength * i + step), Offset.zero);
      }
      // 余った部分
      final double tail = pm.length % partLength;
      dest.addPath(pm.extractPath(pm.length - tail, pm.length), Offset.zero);
    }
    return dest;
  }

  void paintDash(Canvas canvas, Path path, Paint paint) {
    final PathMetrics pms = path.computeMetrics();
    for (var pm in pms) {
      // 破線組合せセットの数
      final int count = pm.length ~/ partLength;
      for (int i = 0; i < count; i++) {
        // 実線部分を描く
        canvas.drawPath(pm.extractPath(partLength * i, partLength * i + step), paint);
      }
      paint.color = Colors.red;
      final double tail = pm.length % partLength;
      canvas.drawPath(pm.extractPath(pm.length - tail, pm.length), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
