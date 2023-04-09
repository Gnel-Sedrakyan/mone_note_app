import 'package:flutter/material.dart';
import 'package:mone_note_app/presentation/core/constants/colors.dart';
import 'package:mone_note_app/presentation/core/constants/defalut_values.dart';

const primaryShadow = BoxShadow(
  color: primaryShadowColor,
  spreadRadius: defaultShadowSpreadRadius,
  blurRadius: defaultShadowBlurRadius,
  offset: defaultShadowOffset,
);

const defaultshadow = BoxShadow(
  color: defaultShadowColor,
  spreadRadius: defaultShadowSpreadRadius,
  blurRadius: defaultShadowBlurRadius,
  offset: defaultShadowOffset,
);

const primaryGradient = LinearGradient(
  colors: [
    textColorDarkTheme,
    Color(0x00E8FCFF),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const buttonPadding = EdgeInsets.all(17);
const appIconButtonConstraints = BoxConstraints(
  minWidth: 50,
  minHeight: 50,
);
