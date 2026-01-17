import 'package:flutter/material.dart';
import 'package:navigation/app/common/theming/colors.dart';
import 'package:navigation/app/common/theming/dimens.dart';

/// Contains common buttons styles for [ElevatedButton].
class ElevatedButtonStyles {
  static ButtonStyle positive(BuildContext context) =>
      positiveOf(AppColorScheme.of(context));
  static ButtonStyle positiveOf(AppColorScheme colors) =>
      base(colors.secondary);

  static ButtonStyle negative(BuildContext context) =>
      negativeOf(AppColorScheme.of(context));
  static ButtonStyle negativeOf(AppColorScheme colors) => base(colors.error);

  static ButtonStyle base(Color color) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(color),
      shadowColor: WidgetStateProperty.all(color),
      elevation: WidgetStateProperty.all(Dimens.buttonElevation),
      padding: WidgetStateProperty.all(Insets.button),
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.buttonRoundCorners),
          ),
        ),
      ),
    );
  }
}

/// Contains common buttons styles for [OutlinedButton].
class OutlinedButtonStyles {
  static ButtonStyle positive(BuildContext context) =>
      positiveOf(AppColorScheme.of(context));
  static ButtonStyle positiveOf(AppColorScheme colors) => base(colors.primary);

  static ButtonStyle negative(BuildContext context) =>
      negativeOf(AppColorScheme.of(context));
  static ButtonStyle negativeOf(AppColorScheme colors) => base(colors.error);

  static ButtonStyle base(Color color) {
    final BorderSide borderSide = BorderSide(
      color: color.withAlpha(160),
      width: Dimens.buttonBorder,
    );

    return ButtonStyle(
      side: WidgetStateProperty.all(borderSide),
      foregroundColor: WidgetStateProperty.all(color.withAlpha(200)),
      padding: WidgetStateProperty.all(Insets.button),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          side: borderSide,
          borderRadius: const BorderRadius.all(
            Radius.circular(Dimens.buttonRoundCorners),
          ),
        ),
      ),
    );
  }
}

/// Contains common buttons styles for [TextButton].
class TextButtonStyles {
  static ButtonStyle positive(BuildContext context) =>
      positiveOf(Theme.of(context).textTheme, AppColorScheme.of(context));

  static ButtonStyle positiveOf(TextTheme textTheme, AppColorScheme colors) =>
      base(
        textTheme: textTheme,
        selectedColor: colors.primary,
        unselectedColor: colors.unselected,
      );

  static ButtonStyle negative(BuildContext context) =>
      negativeOf(Theme.of(context).textTheme, AppColorScheme.of(context));

  static ButtonStyle negativeOf(TextTheme textTheme, AppColorScheme colors) =>
      base(
        textTheme: textTheme,
        selectedColor: colors.error,
        unselectedColor: colors.error.withAlpha(160),
      );

  static ButtonStyle base({
    required TextTheme textTheme,
    required Color selectedColor,
    required Color unselectedColor,
  }) {
    return ButtonStyle(
      textStyle: WidgetStateProperty.all(
        textTheme.labelLarge!.copyWith(fontSize: 17),
      ),
      minimumSize: WidgetStateProperty.all(Size.zero),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      foregroundColor: WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.hovered)) return selectedColor;
        if (states.contains(WidgetState.pressed)) return selectedColor;
        if (states.contains(WidgetState.selected)) return selectedColor;
        return unselectedColor;
      }),
    );
  }
}
