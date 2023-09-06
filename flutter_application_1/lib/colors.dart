import 'package:flutter/material.dart';

const MaterialColor paleta = MaterialColor(_paletaPrimaryValue, <int, Color>{
  50: Color(0xFFEFF9EF),
  100: Color(0xFFD6EFD6),
  200: Color(0xFFBBE5BB),
  300: Color(0xFF9FDA9F),
  400: Color(0xFF8BD28B),
  500: Color(_paletaPrimaryValue),
  600: Color(0xFF6EC56E),
  700: Color(0xFF63BD63),
  800: Color(0xFF59B759),
  900: Color(0xFF46AB46),
});
const int _paletaPrimaryValue = 0xFF76CA76;

const MaterialColor paletaAccent = MaterialColor(_paletaAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_paletaAccentValue),
  400: Color(0xFF9CFF9C),
  700: Color(0xFF83FF83),
});
const int _paletaAccentValue = 0xFFCFFFCF;