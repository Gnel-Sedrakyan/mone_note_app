import 'package:flutter/material.dart';
import 'package:mone_note_app/presentation/core/constants/colors.dart';
import 'package:mone_note_app/presentation/core/constants/styles.dart';

class AppIconButton extends StatefulWidget {
  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() {
        _isPressed = true;
      }),
      onTapUp: (_) => setState(() {
        _isPressed = false;

        widget.onPressed();
      }),
      child: ConstrainedBox(
        constraints: appIconButtonConstraints,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: _isPressed
                ? createMaterialColor(Theme.of(context).colorScheme.surface)
                    .shade100
                : Theme.of(context).colorScheme.surface,
          ),
          child: DefaultTextStyle(
            style: const TextStyle(color: onSurfaceColorDarkTheme),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
