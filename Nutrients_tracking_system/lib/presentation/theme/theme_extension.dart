import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextThemeExtension on TextTheme {
  TextStyle get h1 => GoogleFonts.poppins(fontSize: 26);

  TextStyle get h2 => GoogleFonts.poppins(fontSize: 24);

  TextStyle get h3 => GoogleFonts.poppins(fontSize: 20);
    TextStyle get h6 => GoogleFonts.poppins(fontSize: 30);


  TextStyle get title => GoogleFonts.poppins(fontSize: 18);

  TextStyle get regular => GoogleFonts.poppins(fontSize: 16);

  TextStyle get regularSmall => GoogleFonts.poppins(fontSize: 14);

  TextStyle get h1Bold => h1.copyWith(fontWeight: FontWeight.w700);

  TextStyle get h1Medium => h1.copyWith(fontWeight: FontWeight.w500);

  TextStyle get h2Bold => h2.copyWith(fontWeight: FontWeight.w700);

  TextStyle get h2Medium => h2.copyWith(fontWeight: FontWeight.w500);

  TextStyle get h3Bold => h3.copyWith(fontWeight: FontWeight.w700);
  TextStyle get h3Small => h3.copyWith(fontWeight: FontWeight.w300);

  TextStyle get h3Medium => h3.copyWith(fontWeight: FontWeight.w500);
  TextStyle get small => GoogleFonts.poppins(fontSize: 12);
  TextStyle get h5Small => h5.copyWith(fontWeight: FontWeight.w300);
    TextStyle get largeText => GoogleFonts.poppins(fontSize: 17);
  TextStyle get agSmall => GoogleFonts.poppins(fontSize: 18);
  TextStyle get h5Medium => h5.copyWith(fontWeight: FontWeight.w500);
  TextStyle get h6Medium => h6.copyWith(fontWeight: FontWeight.w400);

    TextStyle get h5 => GoogleFonts.poppins(fontSize: 23);
TextStyle get largeTextMedium =>
      largeText.copyWith(fontWeight: FontWeight.w600);

  TextStyle get smallMedium => small.copyWith(fontWeight: FontWeight.w500);

  TextStyle get regularBold => regular.copyWith(fontWeight: FontWeight.bold);

  TextStyle get regularSemiBold =>
      regular.copyWith(fontWeight: FontWeight.w600);

  TextStyle get regularMedium => regular.copyWith(fontWeight: FontWeight.w500);

  TextStyle get regularSmallBold =>
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold);

  TextStyle get regularSmallMedium =>
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);

  TextStyle get titleBold => title.copyWith(fontWeight: FontWeight.w700);
  
  TextStyle get regularSmallSemiBold =>
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600);
}

extension ThemeExtension on ThemeData {
  BoxDecoration get rosetteCardDecoration => const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color(0x19040404),
            blurRadius: 20,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      );
}
