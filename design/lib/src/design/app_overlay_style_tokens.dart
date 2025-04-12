import 'dart:io';

import 'package:flutter/services.dart';

class AppOverlayStyleTokens {
  static const SystemUiOverlayStyle splashOverlayStyle = SystemUiOverlayStyle(
    systemNavigationBarContrastEnforced: false,
    systemNavigationBarColor: Color(0xFF2756A1),
    systemNavigationBarDividerColor: Color(0xFF2756A1),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    statusBarColor: Color(0xFF2756A1),
  );

  static final SystemUiOverlayStyle systemUiOverlayStyle = Platform.isIOS
      ? const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF2756A1),
          systemNavigationBarDividerColor: Color(0xFF2756A1),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Color(0xFF2756A1),
        )
      : const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF2756A1),
          systemNavigationBarDividerColor: Color(0xFF2756A1),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          statusBarColor: Color(0xFF2756A1),
        );
}
