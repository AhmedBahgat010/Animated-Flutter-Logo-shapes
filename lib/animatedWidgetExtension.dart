
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';

extension AnimatedWidgetExtension on Widget {
  fadeInList(int index, bool isVertical) {
    double offset = 50.0;
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 800),
      child: SlideAnimation(
        horizontalOffset: isVertical ? 0.0 : offset,
        verticalOffset: !isVertical ? 0.0 : offset,
        child: FadeInAnimation(
          child: this,
        ),
      ),
    );
  }
}