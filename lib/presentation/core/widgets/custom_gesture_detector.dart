import 'package:flutter/material.dart';

class CustomGestureDetector extends StatelessWidget {
  const CustomGestureDetector({
    super.key,
    required this.child,
    required this.onPressed,
  });
  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (event) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final Offset localOffset = box.globalToLocal(event.position);

        var maxTapDistance = 100000;
        if (event.position.distanceSquared < maxTapDistance) {
          if (localOffset.dx >= 0 &&
              localOffset.dx < box.size.width &&
              localOffset.dy >= 0 &&
              localOffset.dy < box.size.height) {
            onPressed();
          }
        }
      },
      child: child,
    );
  }
}
