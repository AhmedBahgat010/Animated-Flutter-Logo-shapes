import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

// Custom painter for drawing the Flutter logo
class FlutterLogoPainter extends CustomPainter {
  final double? flutterLogoProgress;

  FlutterLogoPainter({required this.flutterLogoProgress});

  @override
  void paint(Canvas canvas, Size size) {
    final whitePaint = Paint()
      ..strokeWidth = 2.6
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    final curvesPaint = Paint()
      ..strokeWidth = 5
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    double scale = 0.7; // Increased scale factor for resizing the logo

    Path path_0 = Path();
    path_0.moveTo(300 * scale, 171.43 * scale); // Scale coordinates
    path_0.lineTo(300 * scale, 171.43 * scale);
    path_0.lineTo(300 * scale, 171.43 * scale);
    path_0.lineTo(185.72 * scale, 171.43 * scale);
    path_0.lineTo(85.73 * scale, 271.44 * scale);
    path_0.lineTo(142.85 * scale, 328.57 * scale);
    path_0.lineTo(300 * scale, 171.43 * scale);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff54c5f8).withOpacity(1.0);

    Path path_1 = Path();
    path_1.moveTo(57.15 * scale, 242.87 * scale);
    path_1.lineTo(0, 185.72 * scale);
    path_1.lineTo(185.72 * scale, 0);
    path_1.lineTo(300 * scale, 0);
    path_1.lineTo(57.15 * scale, 242.87 * scale);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff54c5f8).withOpacity(1.0);

    Path path_2 = Path();
    path_2.moveTo(142.85 * scale, 328.57 * scale);
    path_2.lineTo(185.72 * scale, 371.44 * scale);
    path_2.lineTo(300 * scale, 371.44 * scale);
    path_2.lineTo(300 * scale, 371.44 * scale);
    path_2.lineTo(200.01 * scale, 271.44 * scale);
    path_2.lineTo(142.85 * scale, 328.57 * scale);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = const Color(0xff01579b).withOpacity(1.0);

    Path path_3 = Path();
    path_3.moveTo(142.85 * scale, 328.57 * scale);
    path_3.lineTo(227.61 * scale, 299.24 * scale);
    path_3.lineTo(200.01 * scale, 271.44 * scale);
    path_3.lineTo(142.85 * scale, 328.57 * scale);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.shader = ui.Gradient.linear(
      Offset(size.width * 20.84700 * scale, size.height * 15.01376 * scale),
      Offset(size.width * 21.41447 * scale, size.height * 14.55539 * scale),
      [const Color(0xff1a237e).withOpacity(0.4), const Color(0xff1a237e).withOpacity(0)],
      [0, 1],
    );

    Path combinedPath = Path();
    combinedPath.addPath(path_0, Offset.zero);
    combinedPath.addPath(path_2, Offset.zero);

    if (flutterLogoProgress != 1.0) {
      animatePath(combinedPath, whitePaint, canvas, flutterLogoProgress!);
      animatePath(path_1, whitePaint, canvas, flutterLogoProgress!);
    }
    if (flutterLogoProgress == 1.0) {
      canvas.drawPath(path_0, paint_0_fill);
      canvas.drawPath(path_1, paint_1_fill);
      canvas.drawPath(path_2, paint_2_fill);
      canvas.drawPath(path_3, paint_3_fill);
    }
  }

  animatePath(Path path, Paint paint, Canvas canvas, double progress) {
    PathMetrics shadowMetrics = path.computeMetrics();
    for (PathMetric pathMetric in shadowMetrics) {
      Path extractPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * progress,
      );
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Redraw every time
  }
}
