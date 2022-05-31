import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';

class TextStyles {
  static final cardTitle = GoogleFonts.outfit(
    fontSize: 24,
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
  );
  static final inputLabel = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.inputPlaceholder,
  );
  static final floatingInputLabel = GoogleFonts.outfit(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    color: AppColors.inputPlaceholder,
  );
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
}
