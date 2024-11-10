import 'package:flutter/material.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';


class TextStyles {
  
  static TextStyle h1 = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 36 / 24,
    color: ColorUtil.text,
  );

  static TextStyle h2 = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 30 / 20,
    color: ColorUtil.text,
  );

  static TextStyle h3 = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 24 / 16,
    color: ColorUtil.text,
  );

  static TextStyle h4 = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 30,
    height: 24 / 16,
    color: ColorUtil.text,
  );

  static TextStyle subHeadlineBold = TextStyle(
    fontFamily: FontFamily.montserratBold,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 20 / 14,
    color: ColorUtil.text,
  );

  static TextStyle subHeadlineRegular = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    color: ColorUtil.text,
  );

  static TextStyle buttonBig = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 24 / 16,
    color: ColorUtil.text,
  );

  static TextStyle buttonSmall = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 18 / 12,
    color: ColorUtil.text,
  );

  static TextStyle body1Bold = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 18 / 12,
    color: ColorUtil.text,
  );
  static TextStyle body1Regular = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 18 / 12,
    color: ColorUtil.text,
  );

  static TextStyle labelBold = TextStyle(
    fontFamily: FontFamily.montserratBold,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 10,
    height: 16 / 10,
    color: ColorUtil.text,
  );

  static TextStyle labelRegular = TextStyle(
    fontFamily: FontFamily.montserratRegular,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 16 / 10,
    color: ColorUtil.text,
  );
}

class FontFamily {
  static const String montserrat = 'Montserrat';
  static const String montserratBold = 'Montserrat Bold';
  static const String montserratRegular = 'Montserrat Regular';
}
