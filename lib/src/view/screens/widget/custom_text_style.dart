import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/utils/size_utils.dart';
import 'package:babysitter_v1/src/core/utils/theme_helper.dart';
import 'package:babysitter_v1/src/core/constant/app_theme.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  static var titleMediumInterWhiteA700;

  static var bodySmallInterWhiteA700;

  static var bodyMediumInter;

  static var titleSmallErrorContainer;

  // Body text style
  static get bodyLargeBlack90003 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90003,
      );
  static get bodyLargeBluegray400 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodyLargeFuturaPTBlack90003 =>
      theme.textTheme.bodyLarge!.futuraPT.copyWith(
        color: appTheme.black90003,
      );
  static get bodyLargeFuturaPTBluegray400 =>
      theme.textTheme.bodyLarge!.futuraPT.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodyLargeFuturaPTBluegray90002 =>
      theme.textTheme.bodyLarge!.futuraPT.copyWith(
        color: appTheme.blueGray90002,
      );
  static get bodyLargeGray80002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray80002,
      );
  static get bodyLargeGray90004 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray90004,
      );
  static get bodyLargeNunitoSansBluegray90002 =>
      theme.textTheme.bodyLarge!.nunitoSans.copyWith(
        color: appTheme.blueGray90002,
      );
  static get bodyLargeff000000 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF000000),
      );
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMediumBlack90003 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90003,
      );
  static get bodyMediumBlack9000313 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90003,
        fontSize: 13.fSize,
      );
  static get bodyMediumBlack90003_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90003.withOpacity(0.2),
      );
  static get bodyMediumBluegray300 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray300,
      );
  static get bodyMediumBluegray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodyMediumGray40002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray40002,
      );
  static get bodyMediumGray60004 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60004,
      );
  static get bodyMediumGray80001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray80001,
      );
  static get bodyMediumGray90004 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90004,
      );
  static get bodyMediumInterBluegray30001 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.blueGray30001,
      );
  static get bodyMediumInterBluegray700 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.blueGray700,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodyMediumQuicksandBlack90001 =>
      theme.textTheme.bodyMedium!.quicksand.copyWith(
        color: appTheme.black90001,
      );
  static get bodyMediumQuicksandBlack90003 =>
      theme.textTheme.bodyMedium!.quicksand.copyWith(
        color: appTheme.black90003,
        fontSize: 13.fSize,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumff000000 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF000000),
      );
  static get bodyMediumff6f6b6b => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF6F6B6B),
      );
  static get bodySmallPoppinsBlack900 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black900,
      );
  static get bodySmallPoppinsBlack90003 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black90003,
      );
  static get bodySmallPoppinsBlack90003_1 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black90003.withOpacity(0.56),
      );
  static get bodySmallPoppinsBluegray30003 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.blueGray30003,
      );
  static get bodySmallPoppinsBluegray700 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.blueGray700,
      );
  static get bodySmallPoppinsBluegray90005 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.blueGray90005.withOpacity(0.56),
      );
  static get bodySmallPoppinsGray800 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray800,
      );
  static get bodySmallPoppinsPrimary =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallRubikBlack900 =>
      theme.textTheme.bodySmall!.rubik.copyWith(
        color: appTheme.black900,
      );
  // Display text style
  static get displaySmallItimWhiteA700 =>
      theme.textTheme.displaySmall!.itim.copyWith(
        color: appTheme.whiteA700,
        fontSize: 36.fSize,
        fontWeight: FontWeight.w400,
      );
  // Headline text style
  static get headlineLargeFuturaPTRed800 =>
      theme.textTheme.headlineLarge!.futuraPT.copyWith(
        color: appTheme.red800,
        fontWeight: FontWeight.bold,
      );
  static get headlineLargePoppinsPrimary =>
      theme.textTheme.headlineLarge!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallBlack90003 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black90003,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallFuturaPTPrimary =>
      theme.textTheme.headlineSmall!.futuraPT.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallGray90001 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallMedium => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallUrbanistGray90003 =>
      theme.textTheme.headlineSmall!.urbanist.copyWith(
        color: appTheme.gray90003.withOpacity(0.42),
      );
  static get headlineSmallUrbanistGray90003_1 =>
      theme.textTheme.headlineSmall!.urbanist.copyWith(
        color: appTheme.gray90003,
      );
  static get headlineSmallUrbanistPink800 =>
      theme.textTheme.headlineSmall!.urbanist.copyWith(
        color: appTheme.pink800,
      );
  static get headlineSmallUrbanistPink800_1 =>
      theme.textTheme.headlineSmall!.urbanist.copyWith(
        color: appTheme.pink800.withOpacity(0.42),
      );
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  static get labelLargeBlack90003 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90003.withOpacity(0.5),
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeBluegray400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray400,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeBluegray700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray700,
        fontSize: 12.fSize,
      );
  static get labelLargeBluegray90001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray90001,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeBluegray90003 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray90003,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeFuturaPT =>
      theme.textTheme.labelLarge!.futuraPT.copyWith(
        fontSize: 12.fSize,
        fontWeight: FontWeight.bold,
      );
  static get labelLargeFuturaPTGray80003 =>
      theme.textTheme.labelLarge!.futuraPT.copyWith(
        color: appTheme.gray80003,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeGray50001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeGray50002 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50002,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeGray60003 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray60003,
        fontSize: 12.fSize,
      );
  static get labelLargeGray60004 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray60004,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeGray80003 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray80003,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeInterGray60003 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.gray60003,
        fontSize: 12.fSize,
      );
  static get labelLargeMedium => theme.textTheme.labelLarge!.copyWith(
        fontSize: 12,
        fontFamily: "Futura PT",
        fontWeight: FontWeight.w500,
      );
  static get labelLargeMedium_1 => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get labelLargeMontserratBluegray90002 =>
      theme.textTheme.labelLarge!.montserrat.copyWith(
        color: appTheme.blueGray90002,
        fontSize: 12,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeRed800 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.red800,
        fontSize: 12.fSize,
      );
  static get labelLargeRubikPrimary =>
      theme.textTheme.labelLarge!.rubik.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeff303535 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF303535),
        fontSize: 11,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeffa30e39 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFFA30E39),
        fontSize: 11,
      );
  static get labelMediumPoppinsBluegray90003 =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: appTheme.blueGray90003,
      );
  // Title text style
  static get titleLargeBlack90002 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black90002,
      );
  static get titleLargeFuturaPTBlack90003 =>
      theme.textTheme.titleLarge!.futuraPT.copyWith(
        color: appTheme.black90003,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeGray60001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray60001,
        fontWeight: FontWeight.w400,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );
  static get titleLargeQuicksandWhiteA700 =>
      theme.textTheme.titleLarge!.quicksand.copyWith(
        color: appTheme.whiteA700,
        fontSize: 21.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeRed800 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.red800,
      );
  static get titleMediumBlack90002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90002,
      );
  static get titleMediumBluegray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleMediumBluegray90002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90002,
      );
  static get titleMediumBluegray90003 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90003,
      );
  static get titleMediumBluegray90003Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90003,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBluegray90004 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90004,
      );
  static get titleMediumErrorContainer => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumErrorContainer19 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 19.fSize,
      );
  static get titleMediumFuturaPT =>
      theme.textTheme.titleMedium!.futuraPT.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumFuturaPTPrimary =>
      theme.textTheme.titleMedium!.futuraPT.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumFuturaPTPrimaryMedium =>
      theme.textTheme.titleMedium!.futuraPT.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumFuturaPTRed800 =>
      theme.textTheme.titleMedium!.futuraPT.copyWith(
        color: appTheme.red800,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray10002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray10002,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray800,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 18.fSize,
      );
  static get titleMediumGray90003 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90003,
      );
  static get titleMediumGray90003Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90003,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray90004 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90004,
        fontSize: 18.fSize,
      );
  static get titleMediumGray90006 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90006,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterBluegray900 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumInterErrorContainer =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.errorContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPink800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.pink800,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
      );
  static get titleMediumPrimary18 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
      );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumPrimary_2 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumQuicksand =>
      theme.textTheme.titleMedium!.quicksand.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumQuicksandBluegray900 =>
      theme.textTheme.titleMedium!.quicksand.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumQuicksandBold =>
      theme.textTheme.titleMedium!.quicksand.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumQuicksandGray600 =>
      theme.textTheme.titleMedium!.quicksand.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumQuicksandGray90003 =>
      theme.textTheme.titleMedium!.quicksand.copyWith(
        color: appTheme.gray90003,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumQuicksandMedium =>
      theme.textTheme.titleMedium!.quicksand.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumQuicksandWhiteA700 =>
      theme.textTheme.titleMedium!.quicksand.copyWith(
        color: appTheme.whiteA700,
        fontSize: 19.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumRed800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.red800,
      );
  static get titleMediumUrbanistGray90003 =>
      theme.textTheme.titleMedium!.urbanist.copyWith(
        color: appTheme.gray90003,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumUrbanistWhiteA700 =>
      theme.textTheme.titleMedium!.urbanist.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
      );
  static get titleMediumWhiteA700Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumWhiteA700_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumff000000 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w500,
      );
  static get titleSmallFuturaPTGray80003 =>
      theme.textTheme.titleSmall!.futuraPT.copyWith(
        color: appTheme.gray80003,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray60003 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray60003,
      );
  static get titleSmallPoppinsBlack90003 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black90003.withOpacity(0.42),
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBlack9000315 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black90003,
        fontSize: 15.fSize,
      );
  static get titleSmallPoppinsBlack90003Medium =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black90003,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBlack90003Medium15 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black90003,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBlack90003_1 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black90003,
      );
  static get titleSmallPoppinsBluegray400 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray400,
      );
  static get titleSmallPoppinsBluegray400Medium =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray400,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBluegray90001 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray90001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBluegray90003 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray90003,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBluegray90004 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray90004,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBluegray9000415 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray90004,
        fontSize: 15.fSize,
      );
  static get titleSmallPoppinsErrorContainer =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 15.fSize,
      );
  static get titleSmallPoppinsGray50001 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsGray50002 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray50002,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsGray60001 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray60001,
      );
  static get titleSmallPoppinsGray60003 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray60003,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsGray80003 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray80003,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsPink800 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.pink800,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsPrimary =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsPrimary15 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 15.fSize,
      );
  static get titleSmallPoppinsPrimary_1 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallPoppinsRed50 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.red50,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsRed50Medium =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.red50,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsWhiteA700 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPoppinsWhiteA70015 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
      );
  static get titleSmallPoppinsWhiteA700Medium =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsWhiteA700_1 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallPoppinsffa30e39 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: Color(0XFFA30E39),
        fontWeight: FontWeight.w500,
      );
  static get titleSmallQuicksandBlack90003 =>
      theme.textTheme.titleSmall!.quicksand.copyWith(
        color: appTheme.black90003,
        fontSize: 15.fSize,
      );
  static get titleSmallQuicksandGray60002 =>
      theme.textTheme.titleSmall!.quicksand.copyWith(
        color: appTheme.gray60002,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallQuicksandIndigo600 =>
      theme.textTheme.titleSmall!.quicksand.copyWith(
        color: appTheme.indigo600,
      );
  static get titleSmallQuicksandWhiteA700 =>
      theme.textTheme.titleSmall!.quicksand.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
      );
  static get titleSmallUrbanistGreen500 =>
      theme.textTheme.titleSmall!.urbanist.copyWith(
        color: appTheme.green500,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallUrbanistRed600 =>
      theme.textTheme.titleSmall!.urbanist.copyWith(
        color: appTheme.red600,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get quicksand {
    return copyWith(
      fontFamily: 'Quicksand',
    );
  }

  TextStyle get futuraPT {
    return copyWith(
      fontFamily: 'Futura PT',
    );
  }

  TextStyle get rubik {
    return copyWith(
      fontFamily: 'Rubik',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get itim {
    return copyWith(
      fontFamily: 'Itim',
    );
  }

  TextStyle get nunitoSans {
    return copyWith(
      fontFamily: 'Nunito Sans',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get urbanist {
    return copyWith(
      fontFamily: 'Urbanist',
    );
  }
}
