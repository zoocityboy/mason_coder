part of 'helpers.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    Locale? forcedLocale,
    GoRouter? mockRouter,
    ThemeMode? themeMode,
  }) async {
    await binding.setSurfaceSize(
      const Size(1080, 2340),
    ); //pt: 375 x 812, ppi:	476 iPhone 13 mini
    return pumpWidget(
      MaterialApp(
        locale: forcedLocale,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
        home: InheritedGoRouter(
          goRouter: mockRouter ?? MockGoRouter(),
          child: widget,
        ),
      ),
    );
  }
}
