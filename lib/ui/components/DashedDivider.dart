import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_bazaar/ui/theme.dart';

class DashedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return dashPath(width: MediaQuery.of(context).size.width - 16);
  }

  CustomPaint dashPath({double width}) {
    return CustomPaint(
        size: Size(width, 0),
        foregroundPainter: _DottedLinePainter()
          ..color = ThemeColors.primaryColor
          ..dottedLength = 8
          ..space = 8
          ..strokeWidth = 2);
  }
}

class _DottedLinePainter extends CustomPainter {
  Color color;
  double dottedLength;
  double space;
  double strokeWidth;
  Radius topLeft = Radius.zero;
  Radius topRight = Radius.zero;
  Radius bottomRight = Radius.zero;
  Radius bottomLeft = Radius.zero;

  @override
  void paint(Canvas canvas, Size size) {
    var isHorizontal = size.width > size.height;
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    {
      double length = isHorizontal ? size.width : size.height;
      double count = (length) / (dottedLength + space) + 1;
      var startOffset = Offset(0, 0);
      for (int i = 0; i < count.toInt(); i++) {
        canvas.drawLine(
            startOffset,
            startOffset.translate((isHorizontal ? dottedLength : 0),
                (isHorizontal ? 0 : dottedLength)),
            paint);
        startOffset = startOffset.translate(
            (isHorizontal ? (dottedLength + space) : 0),
            (isHorizontal ? 0 : (dottedLength + space)));
      }
    }
  }

  Path buildDashPath(Path path, double dottedLength, double space) {
    final Path path = Path();
    for (PathMetric metric in path.computeMetrics()) {
      double start = 0.0;
      while (start < metric.length) {
        double end = start + dottedLength;
        path.addPath(metric.extractPath(start, end), Offset.zero);
        start = end + space;
      }
    }
    return path;
  }

  @override
  bool shouldRepaint(_DottedLinePainter oldDelegate) {
    return true;
  }
}
