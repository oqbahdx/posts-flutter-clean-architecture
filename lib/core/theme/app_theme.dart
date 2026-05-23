import 'package:flutter/material.dart';

/// App color palette — single source of truth
class AppColors {
  AppColors._();

  // Brand
  static const primary = Color(0xFF4F46E5);       // Indigo 600
  static const primaryLight = Color(0xFFEEF2FF);  // Indigo 50
  static const primaryMid = Color(0xFFC7D2FE);    // Indigo 200

  // Neutrals
  static const ink = Color(0xFF111827);            // Gray 900
  static const inkMuted = Color(0xFF6B7280);       // Gray 500
  static const inkLight = Color(0xFF9CA3AF);       // Gray 400
  static const surface = Color(0xFFFFFFFF);
  static const background = Color(0xFFF9FAFB);     // Gray 50
  static const border = Color(0xFFE5E7EB);         // Gray 200
  static const borderFocus = Color(0xFF4F46E5);

  // Semantic
  static const error = Color(0xFFDC2626);          // Red 600
  static const errorLight = Color(0xFFFEF2F2);
  static const success = Color(0xFF16A34A);        // Green 600
  static const successLight = Color(0xFFF0FDF4);
}

/// Text styles using Outfit — add to pubspec: outfit: ^3.0.0
class AppTextStyles {
  AppTextStyles._();

  static const _outfit = 'Outfit';

  static const displayLarge = TextStyle(
    fontFamily: _outfit,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
    letterSpacing: -0.5,
    height: 1.15,
  );

  static const headlineLarge = TextStyle(
    fontFamily: _outfit,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
    letterSpacing: -0.3,
    height: 1.2,
  );

  static const headlineMedium = TextStyle(
    fontFamily: _outfit,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.ink,
    letterSpacing: -0.2,
    height: 1.25,
  );

  static const titleMedium = TextStyle(
    fontFamily: _outfit,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.ink,
    height: 1.4,
  );

  static const bodyLarge = TextStyle(
    fontFamily: _outfit,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.ink,
    height: 1.6,
  );

  static const bodyMedium = TextStyle(
    fontFamily: _outfit,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.inkMuted,
    height: 1.5,
  );

  static const labelSmall = TextStyle(
    fontFamily: _outfit,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.inkLight,
    height: 1.4,
    letterSpacing: 0.2,
  );

  static const button = TextStyle(
    fontFamily: _outfit,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.0,
  );
}

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Outfit',

      // ─── Color scheme ───────────────────────────────────────────────
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        background: AppColors.background,
        surface: AppColors.surface,
        onSurface: AppColors.ink,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        error: AppColors.error,
      ),

      scaffoldBackgroundColor: AppColors.background,

      // ─── AppBar ─────────────────────────────────────────────────────
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.ink,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: AppColors.border,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Outfit',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
          letterSpacing: -0.2,
        ),
        iconTheme: IconThemeData(color: AppColors.ink, size: 22),
        actionsIconTheme: IconThemeData(color: AppColors.inkMuted, size: 22),
      ),

      // ─── Input fields ────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.inkLight),
        labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.inkMuted),
        floatingLabelStyle: AppTextStyles.labelSmall.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        errorStyle: AppTextStyles.labelSmall.copyWith(color: AppColors.error),
        prefixIconColor: AppColors.inkMuted,
        suffixIconColor: AppColors.inkMuted,
      ),

      // ─── Elevated button ─────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.border,
          disabledForegroundColor: AppColors.inkLight,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: AppTextStyles.button,
        ),
      ),

      // ─── Outlined button ─────────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: AppTextStyles.button,
        ),
      ),

      // ─── Text button ─────────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.button.copyWith(fontWeight: FontWeight.w500),
        ),
      ),

      // ─── Card ────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: AppColors.border, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),

      // ─── FAB ─────────────────────────────────────────────────────────
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        extendedTextStyle: AppTextStyles.button,
        extendedPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      ),

      // ─── Divider ─────────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),

      // ─── Dialog ──────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: AppTextStyles.headlineMedium,
        contentTextStyle: AppTextStyles.bodyMedium,
      ),

      // ─── SnackBar ────────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.ink,
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
      ),

      // ─── Popup menu ──────────────────────────────────────────────────
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.surface,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.border),
        ),
        textStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.ink),
      ),

      // ─── Progress indicator ───────────────────────────────────────────
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),

      // ─── Text theme ──────────────────────────────────────────────────
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: TextStyle(
          fontFamily: 'Outfit',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
          letterSpacing: -0.1,
          height: 1.3,
        ),
        titleMedium: AppTextStyles.titleMedium,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
    );
  }
}