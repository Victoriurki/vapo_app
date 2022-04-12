import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vapo_app/AppColors/colors_app.dart';

class AppFont {
  static TextStyle vapo =
      GoogleFonts.permanentMarker(fontSize: 128, color: Colors.white);
      static TextStyle vapo2 =
      GoogleFonts.permanentMarker(fontSize: 15, color: AppColors.gradientcolorA);
  static TextStyle titleapp = GoogleFonts.concertOne(fontSize: 24, color: const Color(0xff272D2D));
  static TextStyle titleapp2 = GoogleFonts.concertOne(fontSize: 18, color: const Color(0xff272D2D));
  static TextStyle titleapp3 = GoogleFonts.concertOne(fontSize: 15, color: Colors.grey);
  static TextStyle subtitleapp = GoogleFonts.concertOne(fontSize: 15, color: Colors.grey);
  static TextStyle datahome = GoogleFonts.concertOne(fontSize: 20, color: Colors.grey);
}
