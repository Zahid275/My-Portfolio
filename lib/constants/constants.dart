import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final background_color = Color(0xFF000218);

TextStyle heading({size=50}) {

  return GoogleFonts.roboto(
    fontSize: size,
    color: Colors.white,
    fontWeight: FontWeight.w800,
  );
}

TextStyle heading2({size=21}) {

  return GoogleFonts.poppins(
    color: Colors.white,
    fontSize: size,
    fontWeight: FontWeight.w500,
  );
}

TextStyle smallText({size=12}) {

  return GoogleFonts.poppins(color: Colors.white, fontSize: size);
}

TextStyle greyText({size=13}) {

  return GoogleFonts.poppins(color: Colors.grey, fontSize: size);
}

TextStyle greyText2({size=15}) {

  return GoogleFonts.poppins(color: Colors.grey, fontSize: size);
}


midText({size=16}){
  return TextStyle(fontSize: size, fontWeight: FontWeight.w500,color: Colors.white70);
}