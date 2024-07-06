import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  
   static const  Color primaryColor =Color.fromARGB(255, 219, 37, 37);
   static const  Color second =Color.fromARGB(255, 192, 117, 136);
  static const Color redSplash = Color.fromARGB(255, 73, 69, 70);
  static const Color white = Color(0xFFFFFFFF);
}




class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF272626),
    primaryContainer: Color(0XFF808D9E),
    secondaryContainer: Color(0XA5272626),

    // Error colors
    errorContainer: Color(0XFF374151),
    onErrorContainer: Color(0XFF03003A),

    // On colors(text colors)
    onPrimary: Color(0XFFFFCCD3),
    onPrimaryContainer: Color(0XFF0F1828),
  );
}
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF020E12);
  Color get black90001 => Color(0XFF060620);
  Color get black90002 => Color(0XFF09090A);
  Color get black90003 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFCCCCCC);
  Color get blueGray10001 => Color(0XFFD1D0D0);
  Color get blueGray300 => Color(0XFFA1A3B0);
  Color get blueGray30001 => Color(0XFF9CA3AF);
  Color get blueGray30002 => Color(0XFF8DBEA6);
  Color get blueGray30003 => Color(0XFFA1A1BC);
  Color get blueGray400 => Color(0XFF8A8686);
  Color get blueGray50 => Color(0XFFE9ECF2);
  Color get blueGray5001 => Color(0XFFEAECF2);
  Color get blueGray700 => Color(0XFF4B5563);
  Color get blueGray70001 => Color(0XFF535353);
  Color get blueGray900 => Color(0XFF1F2A37);
  Color get blueGray90001 => Color(0XFF2F3933);
  Color get blueGray90002 => Color(0XFF123258);
  Color get blueGray90003 => Color(0XFF303535);
  Color get blueGray90004 => Color(0XFF1C2A3A);
  Color get blueGray90005 => Color(0XFF333333);
  Color get blueGray90006 => Color(0XFF292D32);
  Color get blueGray90068 => Color(0X68263238);

  // DeepOrange
  Color get deepOrange50 => Color(0XFFF6EAEC);
  Color get deepOrange5001 => Color(0XFFFFE3E5);
  Color get deepOrange5002 => Color(0XFFFDE8E8);
  Color get deepOrangeA700 => Color(0XFFF91A03);

  // Gray
  Color get gray100 => Color(0XFFF3F4F6);
  Color get gray10001 => Color(0XFFF6F6F6);
  Color get gray10002 => Color(0XFFF6F5F5);
  Color get gray200 => Color(0XFFE5E7EB);
  Color get gray300 => Color(0XFFE6E6E6);
  Color get gray30001 => Color(0XFFE7E6E6);
  Color get gray400 => Color(0XFFBDBDBD);
  Color get gray40001 => Color(0XFFB8B8B8);
  Color get gray40002 => Color(0XFFB1AFB0);
  Color get gray50 => Color(0XFFF4FCFF);
  Color get gray500 => Color(0XFF9B9BA6);
  Color get gray50001 => Color(0XFFAAAAAA);
  Color get gray50002 => Color(0XFFA8A8A8);
  Color get gray50003 => Color(0XFF959595);
  Color get gray5001 => Color(0XFFF9FAFB);
  Color get gray5002 => Color(0XFFFFFCF2);
  Color get gray5003 => Color(0XFFF7F8FA);
  Color get gray600 => Color(0XFF777676);
  Color get gray60001 => Color(0XFF6D6E71);
  Color get gray60002 => Color(0XFF777777);
  Color get gray60003 => Color(0XFF6B7280);
  Color get gray60004 => Color(0XFF6F6B6B);
  Color get gray800 => Color(0XFF3D3C3C);
  Color get gray80001 => Color(0XFF464444);
  Color get gray80002 => Color(0XFF383737);
  Color get gray80003 => Color(0XFF3C4242);
  Color get gray900 => Color(0XFF13191B);
  Color get gray90001 => Color(0XFF222222);
  Color get gray90002 => Color(0XFF5D061C);
  Color get gray90003 => Color(0XFF1D1D25);
  Color get gray90004 => Color(0XFF121826);
  Color get gray90005 => Color(0XFF0C221F);
  Color get gray90006 => Color(0XFF1B1E34);

  // GrayD
  Color get gray300D3 => Color(0XD3E4E4E4);

  // Grayf
  Color get gray5003f => Color(0X3F939393);

  // Green
  Color get green50 => Color(0XFFDEF7E4);
  Color get green500 => Color(0XFF47BD68);
  Color get green50001 => Color(0XFF4CB944);
  Color get green800 => Color(0XFF0EA325);
  Color get greenA700 => Color(0XFF08B219);

  // Indigo
  Color get indigo50 => Color(0XFFE2E8F0);
  Color get indigo500 => Color(0XFF4467AD);
  Color get indigo600 => Color(0XFF2D2DC1);
  Color get indigoA200 => Color(0XFF4676ED);

  // Orange
  Color get orange100 => Color(0XFFFFD7A7);
  Color get orange300 => Color(0XFFFEB052);

  // Pink
  Color get pink200 => Color(0XFFFFA1AE);
  Color get pink800 => Color(0XFFA30E39);
  Color get pink80001 => Color(0XFF9F1253);
  Color get pink900 => Color(0XFF8B1038);
  Color get pink90001 => Color(0XFF771D1D);

  // Red
  Color get red400 => Color(0XFFEF5350);
  Color get red40001 => Color(0XFFE54660);
  Color get red50 => Color(0XFFFFF1F2);
  Color get red600 => Color(0XFFEC2828);
  Color get red700 => Color(0XFFD92445);
  Color get red800 => Color(0XFFC30D3B);
  Color get redA200 => Color(0XFFF93A5D);
  Color get redA400 => Color(0XFFE71748);
  Color get redA700 => Color(0XFFFF0303);
  Color get redA70001 => Color(0XFFF00101);

  // Teal
  Color get teal900 => Color(0XFF014737);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);

  // Yellow
  Color get yellowA700 => Color(0XFFFFD400);
}



