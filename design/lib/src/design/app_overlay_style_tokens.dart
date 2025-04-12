import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

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

SystemUiOverlayStyle get systemUiOverlayStyle {
  return const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF2756A1),
    systemNavigationBarDividerColor: Color(0xFF2756A1),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    statusBarColor: Color(0xFF2756A1),
  );
}
}
