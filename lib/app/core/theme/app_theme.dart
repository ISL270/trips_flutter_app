import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trips_flutter_app/app/core/constants/app_colors.dart';

/// App theme configuration (dark mode only)
class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        surface: AppColors.background,
        surfaceContainerHighest: AppColors.secondaryBackground,
        onSurface: AppColors.white,
        onPrimary: AppColors.black,
      ),

      // Scaffold
      scaffoldBackgroundColor: AppColors.background,

      // Card theme
      cardTheme: const CardThemeData(
        color: AppColors.secondaryBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),

      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: AppColors.white),
        titleTextStyle: GoogleFonts.inter(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Text theme - Based on Figma specifications
      textTheme: TextTheme(
        // Page Heading (32px Regular) - Figma Node 1:389
        displaySmall: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          height: 38.73 / 32,
          color: AppColors.white,
        ),

        // Card/Item Title (18px Regular) - Figma Node 1:418
        headlineSmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 26 / 18,
          letterSpacing: -0.54,
          color: AppColors.white,
        ),

        // Body Text / Profile Name (14px Regular) - Figma Nodes 1:382, 1:414
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 22 / 14,
          letterSpacing: -0.42,
          color: AppColors.white,
        ),

        // Caption / Date Text (12px Regular) - Figma Nodes 1:420, 1:437
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 18 / 12,
          letterSpacing: -0.36,
          color: AppColors.white,
        ),

        // Button Text / Active Tab (14px Medium) - Figma Nodes 1:398, 1:355
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 18 / 14,
          letterSpacing: -0.42,
          color: AppColors.white,
        ),

        // Small Caption (12px Regular)
        labelSmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 18 / 12,
          letterSpacing: -0.36,
          color: AppColors.white,
        ),
      ),

      // Icon theme
      iconTheme: const IconThemeData(color: AppColors.white, size: 24),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.black,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.42,
          ),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.42,
          ),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.42,
          ),
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.secondaryBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: GoogleFonts.inter(
          color: AppColors.white.withValues(alpha: 0.5),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.42,
        ),
      ),

      // Divider theme
      dividerTheme: DividerThemeData(
        color: AppColors.white.withValues(alpha: 0.1),
        thickness: 1,
        space: 1,
      ),

      // TabBar theme
      tabBarTheme: TabBarThemeData(
        // Active tab (14px Medium)
        labelStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.42,
          height: 22 / 14,
        ),
        // Inactive tab (14px Regular)
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.42,
          height: 22 / 14,
        ),
      ),
    );
  }
}
