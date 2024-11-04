import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:universe/app_colors.dart';
import 'package:universe/classes/routes.dart';
import 'package:universe/providers/main_provider.dart';
import 'package:universe/screens/home_screen.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MainProvider())],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.accentBlue,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: AppColors.textWhite),
              bodySmall: TextStyle(color: AppColors.textGray)),
        ),
        builder: (context, child) =>
            ResponsiveBreakpoints.builder(breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ], child: child!),
        initialRoute: '/',
        onGenerateInitialRoutes: (initialRoute) {
          final Uri uri = Uri.parse(initialRoute);
          return [buildPage(path: uri.path, queryParams: uri.queryParameters)];
        },
        onGenerateRoute: (RouteSettings settings) {
          final Uri uri = Uri.parse(settings.name ?? '/');
          return buildPage(path: uri.path, queryParams: uri.queryParameters);
        },
      ),
    );
  }

  Route<dynamic> buildPage(
      {required String path, Map<String, String> queryParams = const {}}) {
    return Routes.noAnimation(
        settings: RouteSettings(
            name: (path.startsWith('/') == false) ? '/$path' : path),
        builder: (context) {
          String pathName =
              path != '/' && path.startsWith('/') ? path.substring(1) : path;
          return switch (pathName) {
            '/' => const HomeScreen(),
            'about' => const HomeScreen(),
            'news' => const HomeScreen(),
            _ => const SizedBox.shrink()
          };
        });
  }
}
