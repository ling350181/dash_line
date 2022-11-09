import 'package:dash_line/dash_painter.dart';
import 'package:flutter/material.dart';

class DashDecoration extends Decoration {
  final Gradient? gradient;

  final Color? color;
  final double step;
  final double span;
  final int pointCount;
  final double? pointWidth;
  final Radius? radius;
  final double strokeWidth;

  const DashDecoration(
      {this.gradient,
      this.color,
      this.step = 2,
      this.strokeWidth = 1,
      this.span = 2,
      this.pointCount = 0,
      this.pointWidth,
      this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => DashBoxPainter(this);
}

class DashBoxPainter extends BoxPainter {
  final DashDecoration _decoration;

  DashBoxPainter(this._decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    if (configuration.size == null) {
      return;
    }

    Radius radius = _decoration.radius ?? Radius.zero;
    canvas.save();
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orangeAccent
      ..strokeWidth = _decoration.strokeWidth;
    Path path = Path();

    canvas.translate(
      offset.dx + configuration.size!.width / 2,
      offset.dy + configuration.size!.height / 2,
    );

    final Rect zone = Rect.fromCenter(
      center: Offset.zero,
      width: configuration.size!.width,
      height: configuration.size!.height,
    );

    if (_decoration.color != null) {
      final Paint rectPaint = Paint()..color = _decoration.color!;
      canvas.drawRRect(RRect.fromRectAndRadius(zone, radius), rectPaint);
    }

    path.addRRect(RRect.fromRectAndRadius(
      zone,
      radius,
    ));

    if (_decoration.gradient != null) {
      paint.shader = _decoration.gradient!.createShader(zone);
    }

    path = DashPainter(step: _decoration.step, span: _decoration.span).dashPath(path);
    canvas.drawPath(path, paint);
    canvas.restore();
  }
}
