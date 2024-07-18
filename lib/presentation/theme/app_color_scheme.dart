import 'package:flutter/material.dart';

abstract class AppColorScheme extends ColorScheme {
  const AppColorScheme._light({
    required Color primary,
    required Color onPrimary,
    required Color onSecondary,
    required Color background,
    required Color surfaceTint,
  }) : super.light(
    primary: primary,
    onPrimary: onPrimary,
    onSecondary: onSecondary,
    background: background,
    surfaceTint: surfaceTint,
  );

  const AppColorScheme._dark({
    required Color primary,
    required Color onPrimary,
    required Color onSecondary,
    required Color background,
  }) : super.dark(
      primary: primary,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      background: background);

  factory AppColorScheme.light() {
    return const _LightColorScheme._();
  }

  factory AppColorScheme.dark() {
    throw const _DarkColorScheme._();
  }

  Color get primaryDarkerColor;

  Color get backgroundColor;

  Color get hintColor;

  Color get borderColor;

  Color get itemBackgroundColor;

  Color get buttonColor;

  Color get timerContainerColor;
  Color get landingColor;
  Color get calendarFieldColor;
  Color get calendarWeekOfYearColor;
  Color get calendarDurationColor;
  Color get dateTimeFieldColor;
  Color get calendarWeekFieldTextColor;
  Color get calendarWeekFieldTexSelectedColor;
  Color get calendarWeekFieldDateColor;
  Color get calendarWeekLogColor;
  Color get calendarWeekSelectedLogColor;
  Color get calendarWeekFieldRunningTextColor;
  Color get calendarWeekFieldRunningDayColor;
  Color get calendarWeekFieldRunningLogColor;

  Color get companyCardColor;
}

class _LightColorScheme extends AppColorScheme {
  const _LightColorScheme._()
      : super._light(
    primary: const Color(0xff2186AB),
    onPrimary: const Color(0xff08435A),
    onSecondary: const Color(0xff2186AB),
    background: Colors.white,
    surfaceTint: Colors.transparent,
  );

  @override
  final Color primaryDarkerColor = const Color(0xff1546b9);

  @override
  final Color backgroundColor = const Color(0xff031335);

  @override
  final Color hintColor = const Color(0xffCCCCCC);

  @override
  Color get timerContainerColor => const Color(0xff94BA5D);

  @override
  final Color borderColor = const Color(0xffCCCCCC);

  @override
  final Color itemBackgroundColor = const Color(0xfff6f6f7);

  @override
  final Color buttonColor = const Color(0xffeaf3f7);

  @override
  Color get calendarFieldColor => const Color(0xffF6F6F7);

  @override
  Color get calendarWeekOfYearColor => const Color(0x1a2186ab);



  @override
  Color get dateTimeFieldColor => const Color(0xff2186ab);

  @override
  Color get calendarDurationColor => const Color(0xff999999);

  @override
  Color get calendarWeekFieldTextColor => Colors.black;

  @override
  Color get calendarWeekFieldDateColor => Colors.white;

  @override
  Color get calendarWeekFieldTexSelectedColor => Colors.white;

  @override
  Color get calendarWeekLogColor => Colors.white;

  @override
  Color get calendarWeekSelectedLogColor => hintColor;

  @override
  Color get calendarWeekFieldRunningDayColor => Colors.white;

  @override
  Color get calendarWeekFieldRunningLogColor => Colors.white;

  @override
  Color get calendarWeekFieldRunningTextColor => Colors.white;

  @override
  Color get companyCardColor => const Color(0xffEDEDF0);

  @override
  Color get landingColor => const Color(0x1a2186ab);
}

class _DarkColorScheme extends AppColorScheme {
  const _DarkColorScheme._()
      : super._dark(
      primary: const Color(0xff0361f0),
      onPrimary: const Color(0xff08435A),
      onSecondary: const Color(0xff2186AB),
      background: Colors.white);
  @override
  Color get companyCardColor => throw UnimplementedError();

  @override
  Color get backgroundColor => throw UnimplementedError();

  @override
  Color get borderColor => throw UnimplementedError();

  @override
  Color get buttonColor => throw UnimplementedError();

  @override
  Color get hintColor => throw UnimplementedError();

  @override
  Color get itemBackgroundColor => throw UnimplementedError();

  @override
  Color get primaryDarkerColor => throw UnimplementedError();

  @override
  Color get timerContainerColor => throw UnimplementedError();

  @override
  Color get calendarFieldColor => throw UnimplementedError();

  @override
  Color get calendarWeekOfYearColor => throw UnimplementedError();

  @override
  Color get dateTimeFieldColor => throw UnimplementedError();

  @override
  Color get calendarDurationColor => throw UnimplementedError();

  @override
  Color get calendarWeekFieldTextColor => throw UnimplementedError();

  @override
  Color get calendarWeekFieldDateColor => throw UnimplementedError();

  @override
  Color get calendarWeekFieldTexSelectedColor => throw UnimplementedError();

  @override
  Color get calendarWeekLogColor => throw UnimplementedError();

  @override
  Color get calendarWeekSelectedLogColor => throw UnimplementedError();

  @override
  Color get calendarWeekFieldRunningDayColor => throw UnimplementedError();

  @override
  Color get calendarWeekFieldRunningLogColor => throw UnimplementedError();

  @override
  Color get calendarWeekFieldRunningTextColor => throw UnimplementedError();

  @override
  Color get landingColor => throw UnimplementedError();


}
