import 'package:flutter/material.dart';
import 'package:navigation/app/common/theming/button_styles.dart';
import 'package:navigation/app/common/theming/colors.dart';
import 'package:navigation/app/common/theming/dimens.dart';
import 'package:navigation/app/common/theming/text_themes.dart';

ThemeData get lightTheme => _buildTheme(ColorSchemes.light);

ThemeData get darkTheme => _buildTheme(ColorSchemes.dark);

ThemeData _buildTheme(AppColorScheme colors) {
  final TextTheme textTheme = TextThemes.build(colors);

  final ThemeData base = ThemeData.from(
    colorScheme: colors.toColorScheme(),
    textTheme: textTheme,
  );

  return base.copyWith(
    appBarTheme: _appBarTheme(base, colors),
    elevatedButtonTheme: _elevatedButtonTheme(colors),
    outlinedButtonTheme: _outlinedButtonTheme(colors),
    textButtonTheme: _textButtonTheme(textTheme, colors),
    inputDecorationTheme: _inputDecorationTheme(textTheme, colors),
    dialogTheme: _dialogThemeData(colors),
    cardTheme: _cardThemeData(colors),
    dividerTheme: _dividerTheme(colors),
    iconTheme: _iconTheme(colors),
    textSelectionTheme: _textSelectionTheme(colors),
    primaryColor: colors.primary,
    unselectedWidgetColor: colors.unselected,
    disabledColor: colors.disabled,
    canvasColor: colors.canvas,
    highlightColor: colors.highlight,
    scaffoldBackgroundColor: colors.background,
    tabBarTheme: TabBarThemeData(indicatorColor: colors.primary),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme _appBarTheme(ThemeData base, AppColorScheme colors) {
  return AppBarTheme(
    centerTitle: false,
    backgroundColor: colors.surface,
    titleTextStyle: base.textTheme.bodyLarge,
    iconTheme: base.iconTheme.copyWith(color: colors.secondary),
  );
}

ElevatedButtonThemeData _elevatedButtonTheme(AppColorScheme colors) {
  return ElevatedButtonThemeData(
    style: ElevatedButtonStyles.positiveOf(colors),
  );
}

OutlinedButtonThemeData _outlinedButtonTheme(AppColorScheme colors) {
  return OutlinedButtonThemeData(
    style: OutlinedButtonStyles.positiveOf(colors),
  );
}

TextButtonThemeData _textButtonTheme(
  TextTheme textTheme,
  AppColorScheme colors,
) {
  return TextButtonThemeData(
    style: TextButtonStyles.positiveOf(textTheme, colors),
  );
}

InputDecorationTheme _inputDecorationTheme(
  TextTheme textTheme,
  AppColorScheme colors,
) {
  final InputBorder border = OutlineInputBorder(
    borderSide: BorderSide(color: colors.disabled, width: Dimens.buttonBorder),
    borderRadius: const BorderRadius.all(
      Radius.circular(Dimens.textFieldCorners),
    ),
  );

  return InputDecorationTheme(
    hoverColor: Colors.transparent,
    fillColor: colors.background,
    filled: true,
    isDense: true,
    hintStyle: textTheme.bodyLarge!.copyWith(
      color: colors.primaryContainer.withAlpha(Color.getAlphaFromOpacity(0.8)),
    ),
    errorStyle: textTheme.bodySmall!.copyWith(color: colors.error),
    contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
    border: border,
    enabledBorder: border,
    focusedBorder: border,
  );
}

DialogThemeData _dialogThemeData(AppColorScheme colors) {
  return DialogThemeData(backgroundColor: colors.surface, elevation: 0);
}

CardThemeData _cardThemeData(AppColorScheme colors) {
  return CardThemeData(color: colors.surface, elevation: 0);
}

DividerThemeData _dividerTheme(AppColorScheme colors) {
  return DividerThemeData(
    color: colors.divider,
    space: 0,
    indent: 0,
    endIndent: 0,
  );
}

IconThemeData _iconTheme(AppColorScheme colors) {
  return IconThemeData(color: colors.primary, size: Dimens.iconSize);
}

TextSelectionThemeData _textSelectionTheme(AppColorScheme colors) {
  return TextSelectionThemeData(cursorColor: colors.cursor);
}
