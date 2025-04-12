import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStylesTokens {
  static const _tabularFigures = FontFeature.tabularFigures();

  /// Numbers

  //$num-01
  static TextStyle num01({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 48.0,
        height: 56.0 / 48.0,
        letterSpacing: 0.48,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $num-02
  static TextStyle num02({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 28.0,
        height: 36.0 / 28.0,
        letterSpacing: 0.0,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $num-03
  static TextStyle num03({
    required Color color,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 18.0,
        height: 24.0 / 18.0,
        letterSpacing: 0.0,
        fontFeatures: [_tabularFigures],
      ),
    );
  }

  // $num-04
  static TextStyle num04({
    required Color color,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 12.0,
        height: 20.0 / 12.0,
        letterSpacing: 0.36,
        fontFeatures: [_tabularFigures],
      ),
    );
  }

  // $amount-01
  static TextStyle amount01({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
        height: 36.0 / 32.0,
        letterSpacing: 0.32,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $amount-02
  static TextStyle amount02({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 40.0,
        height: 48.0 / 40.0,
        letterSpacing: 0.4,
        fontFeatures: fontFeatures,
      ),
    );
  }

  /// Headings

  // $heading-01
  static TextStyle heading01({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
        height: 36.0 / 32.0,
        letterSpacing: 0.32,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $heading-02
  static TextStyle heading02({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
        height: 28.0 / 24.0,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $heading-03
  static TextStyle heading03({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
        height: 24.0 / 20.0,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $heading-04
  static TextStyle heading04({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 16.0,
        height: 20.0 / 16.0,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $heading-05
  static TextStyle heading05({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 10.0,
        height: 16.0 / 12.0,
        letterSpacing: 0.84,
        fontFeatures: fontFeatures,
      ),
    );
  }

  /// Body

  // $input-01
  static TextStyle input01({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(300.0)],
        fontSize: 16.0,
        height: 24.0 / 16.0,
        letterSpacing: 0.0,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $input-02
  static TextStyle input02({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 24.0,
        height: 24.0 / 24.0,
        letterSpacing: 0.48,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $body-01
  static TextStyle body01({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(300.0)],
        fontSize: 16.0,
        height: 22.0 / 16.0,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $body-01-paragraph
  static TextStyle body01paragraph({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontSize: 16.0,
        height: 24.0 / 16.0,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $body-01-highlight
  static TextStyle body01highlight({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 16.0,
        height: 20.0 / 16.0,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $body-02
  static TextStyle body02({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(300.0)],
        fontSize: 14.0,
        height: 20.0 / 14.0,
        letterSpacing: 0.14,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $body-02-paragraph
  static TextStyle body02paragraph({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(300.0)],
        fontSize: 14.0,
        height: 20.0 / 14.0,
        letterSpacing: 0.14,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $body-02-highlight
  static TextStyle body02highlight({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 14.0,
        height: 20.0 / 14.0,
        letterSpacing: 0.07,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $body-03
  static TextStyle body03({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 8.0,
        height: 8.0 / 8.0,
        letterSpacing: 0.8,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $body-04
  static TextStyle body04({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(300.0)],
        fontSize: 4.0,
        height: 4.0 / 4.0,
        letterSpacing: 0.48,
        fontFeatures: fontFeatures,
      ),
    );
  }

  /// Call to action

  // $cta-regular
  static TextStyle ctaRegular({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        height: 20.0 / 16.0,
        letterSpacing: 0.16,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $cta-small
  static TextStyle ctaSmall({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        height: 20.0 / 14.0,
        letterSpacing: 0.14,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $cta-bottom-nav
  static TextStyle ctaBottomNav({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 10.0,
        height: 16.0 / 10.0,
        letterSpacing: 0.2,
        fontFeatures: fontFeatures,
      ),
    );
  }

  /// Support

  // $caption-01
  static TextStyle caption01({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(300.0)],
        fontSize: 12.0,
        height: 16.0 / 12.0,
        letterSpacing: 0.24,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $caption-01-highlight
  static TextStyle caption01highlight({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 12.0,
        height: 16.0 / 12.0,
        letterSpacing: 0.06,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $caption-01-highlight-dotted
  static TextStyle caption01highlightDotted({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 12.0,
        height: 16.0 / 12.0,
        letterSpacing: 0.06,
        fontFeatures: fontFeatures,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dotted,
      ),
    );
  }

  // $label-01
  static TextStyle label01({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 12.0,
        height: 16.0 / 12.0,
        letterSpacing: 0.06,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $tiny-01
  static TextStyle tiny01({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(400.0)],
        fontSize: 10.0,
        height: 12.0 / 10.0,
        letterSpacing: 0.0,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $tiny-02
  static TextStyle tiny02({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 10.0,
        height: 12.0 / 10.0,
        letterSpacing: 0.7,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $stories-01
  static TextStyle stories01({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 28.0,
        height: 32.0 / 28.0,
        letterSpacing: -1.008,
        fontFeatures: fontFeatures,
      ),
    );
  }

  // $stories-02
  static TextStyle stories02({
    required Color color,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontVariations: const [FontVariation.weight(500.0)],
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
        height: 25.0 / 18.0,
        letterSpacing: -0.36,
        fontFeatures: fontFeatures,
      ),
    );
  }
}
