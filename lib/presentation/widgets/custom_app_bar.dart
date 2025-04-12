import 'package:design/design.dart' as design;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show AppBar;

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, required String title})
    : super(
        title: Text(
          title,
          style: design.AppTextStylesTokens.heading03(
            color: design.AppColorsTokens.textInv01,
          ),
        ),
      );
}
