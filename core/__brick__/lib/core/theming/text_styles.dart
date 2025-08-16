import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_weight_helper.dart';


class TextStyles {
  TextStyles._();
  static const TextStyle font31BlackBold = TextStyle(
    fontSize: 31,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.black,
  );
  static const TextStyle font17redAccentBold = TextStyle(
    fontSize: 17.5,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.redAccent,
  );
  static const TextStyle font15redAccentBold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.redAccent,
  );
  static TextStyle font25GreyCustomShadeBold = TextStyle(
    fontSize: 25,
    color: ColorManager.greyCustomShade,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14GreyCustomShadeLight = TextStyle(
    fontSize: 14,
    color: ColorManager.greyCustomShade,
    fontWeight: FontWeightHelper.light,
  );

  static const TextStyle font17GreyNormal = TextStyle(
    fontSize: 17.5,
    fontWeight: FontWeightHelper.regular,
    color: Colors.grey,
  );
  static const TextStyle font18WhiteBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.white,
  );
  static const TextStyle font14GreyNormal = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.grey,
  );
  static const TextStyle font15GreyBold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.grey,
  );
  static TextStyle font20GCustomGreyExtraBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.extraBold,
    color: ColorManager.greyCustomShade,
  );
  static TextStyle font25CustomGreyBold = TextStyle(
    fontSize: 25,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.black, // looooooooooool
  );
  static TextStyle font16GreyNormal = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.greyCustomShade,
  );
  static const font17GreyBold = TextStyle(
    fontSize: 17,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.grey,
  );
  static TextStyle font18WhiteRegular = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.white,
  );
  static TextStyle font14GreyCustomShadeRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.greyCustomShade,
  );
  static TextStyle font14CustomGreyRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.greyCustomShade,
  );
  static TextStyle font14CustomGreyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.greyCustomShade,
  );
  static TextStyle font16CustomGreyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.greyCustomShade,
  );

  static TextStyle font18CustomGreyLight = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.extraLight,
    color: ColorManager.greyCustomShade,
  );
  static const TextStyle font14WhiteExtraBold = TextStyle(
    color: ColorManager.white,
    fontSize: 14,
    fontWeight: FontWeightHelper.extraBold,
  );

  static const TextStyle font17nHalfBlackBold = TextStyle(
    fontSize: 17.5,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.black,
  );

  static TextStyle font14GreyCustomShadeReguler = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.greyCustomShade,
  );

  static const TextStyle font16WhiteBoldSpacingHalf = TextStyle(
    color: ColorManager.white,
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    letterSpacing: 0.5,
  );
  static const TextStyle font16WhiteExtraBoldSpacingHalf = TextStyle(
    color: ColorManager.white,
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    letterSpacing: 0.5,
  );
  static TextStyle font16greyCustomShadeBoldSpacingHalf = TextStyle(
    color: ColorManager.greyCustomShade,
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    letterSpacing: 0.5,
  );
}
