import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';

class TextStyles {
  static final title = GoogleFonts.outfit(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static final cardTitle = GoogleFonts.outfit(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static final cardCaption = GoogleFonts.outfit(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textCaption,
  );
  static final button = GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.buttons,
      letterSpacing: 2.0);
  static final transparentButton = GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
      letterSpacing: 2.0);
  static final inputLabel = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.inputPlaceholder,
  );
  static final smallText = GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.inputPlaceholder,
  );
  static final socialLoginText = GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.inputPlaceholder,
      letterSpacing: 1.0);
  static final listFirst = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static final listDefault = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textCaption,
  );
  static final mediumBoldText = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.inputPlaceholder,
  );
  static final mediumText = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.inputPlaceholder,
  );
  static final mediumTextBlack = GoogleFonts.outfit(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary);
}
