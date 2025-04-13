import 'dart:ui' show Color;

import 'package:design/src/design/app_colors.dart';

class AppColorsTokens {
  /// Core

  // $transparent
  static Color get transparent => AppColors.black.withValues(alpha: 0.0);

  // $background-01
  static Color get background01 => Color(0xFF2756A1);

  // $background-02
  static Color get background02 => Color(0xFFFFFFFF);

  // $background-overlay-01
  static Color get backgroundOverlay01 =>
      AppColors.black.withValues(alpha: 0.6);

  // $background-overlay-02
  static Color get backgroundOverlay02 =>
      AppColors.black.withValues(alpha: 0.8);

  // $trade-inputs-bg-01
  static Color get tradeInputsBackground01 =>
      AppColors.p500.withValues(alpha: 0.15);

  // $button_shadow
  static Color get buttonShadow => const Color(0x19000000);

  // $layer-01
  static Color get layer01 => AppColors.white;

  // $layer-01-1
  static Color get layer011 => AppColors.n150;

  // $layer-02
  static Color get layer02 => AppColors.n100;

  // $layer-02-1
  static Color get layer021 => AppColors.p100;

  // $layer-03
  static Color get layer03 => AppColors.n200;

  // $layer-04
  static Color get layer04 => AppColors.n300;

  // $p350
  static Color get p350 => AppColors.p350;

  // $layer-04-1
  static Color get layer041 => AppColors.p500;

  // $layer-05
  static Color get layer05 => AppColors.n800;

  // $layer-06
  static Color get layer06 => AppColors.black.withValues(alpha: 0.03);

  // $positive-01
  static Color get positive01 => AppColors.s500;

  // $positive-01-back
  static Color get positive01back => AppColors.s100;

  // $negative-01
  static Color get negative01 => AppColors.d500;

  // $negative-01-back
  static Color get negative01back => AppColors.d100;

  // $icons-01
  static Color get icons01 => AppColors.black;

  // $error-01
  static Color get error01 => AppColors.d500;

  /// Text

  // $text-01
  static Color get text01 => Color(0xFFFFFFFF);

  // $text-02
  static Color get text02 => Color(0xFFEE2324);

  // $text-03
  static Color get text03 =>  Color(0xFF2756A1);

  // $text-04
  static Color get text04 => AppColors.black;

  // $text-05
  static Color get text05 => AppColors.black.withValues(alpha: 0.5);

  // $text-inv-01
  static Color get textInv01 => AppColors.white;

  // $text-positive-01
  static Color get textPositive01 => AppColors.s500;

  // $text-positive-02
  static Color get textPositive02 => AppColors.s400;

  // $text-negative-01
  static Color get textNegative01 => AppColors.d500;

  // $text-negative-02
  static Color get textNegative02 => AppColors.d400;

  // $text-error-01
  static Color get textError01 => AppColors.d500;

  /// Interactive

  // $interactive-01
  static Color get interactive01 => AppColors.black;

  // $interactive-01-pressed
  static Color get interactive01pressed => AppColors.n900;

  // $interactive-01-disabled
  static Color get interactive01disabled => AppColors.n200;

  // $on-interactive-01
  static Color get onInteractive01 => AppColors.white;

  // $numpad-01
  static Color get numPad01 => AppColors.white;

  // $numpad-border-01
  static Color get numPadBorder01 => AppColors.n200;

  // $numpad-01-pressed
  static Color get numPad01pressed => AppColors.n100;

  // $numpad-border-01-pressed
  static Color get numPadBorder01pressed => AppColors.n100;

  // $interactive-success-01
  static Color get interactiveSuccess01 => AppColors.s500;

  // $interactive-success-01-pressed
  static Color get interactiveSuccess01pressed => AppColors.s600;

  // $interactive-error-01
  static Color get interactiveError01 => AppColors.d500;

  // $interactive-error-01-pressed
  static Color get interactiveError01pressed => AppColors.d600;

  // $link-01
  static Color get link01 => AppColors.p700;

  // $link-01-pressed
  static Color get link01pressed => AppColors.p900;

  // $interactive-02
  static Color get interactive02 => const Color(0xFFF5F4F2);

  // $border-highlight-01
  static Color get borderHighlight01 => AppColors.black.withValues(alpha: 0.07);

  // $bn-disabled
  static Color get bnDisabled => AppColors.n600;

  // $black-20
  static Color get black20 => AppColors.black.withValues(alpha: 0.2);

  // $white-20
  static Color get white20 => AppColors.white.withValues(alpha: 0.2);

  // $selector-border-01
  static Color get selectorBorder01 => AppColors.p150;

  // $white-7
  static Color get white07 => AppColors.white.withValues(alpha: 0.07);

  // $interactive-attention-01
  static Color get interactiveAttention01 => AppColors.a500;
}
