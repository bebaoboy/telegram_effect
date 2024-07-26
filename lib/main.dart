import 'package:clone_telegram/animated_theme_app.dart';
import 'package:clone_telegram/animation_type.dart';
import 'package:clone_telegram/provider/negara.dart';
import 'package:clone_telegram/provider/theme.dart';
import 'package:clone_telegram/provider/qr_provider.dart';
import 'package:clone_telegram/screens/SplashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeModel()),
        ChangeNotifierProvider(create: (context) => NegaraProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QrController(),
        ),
        ChangeNotifierProvider(
          create: (_) => NegaraProvider(),
        ),
        ListenableProvider(create: (_) => ThemeModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
          return AnimatedThemeApp(
            title: 'Telegram Clone',
            animationType: AnimationType.CIRCULAR_ANIMATED_THEME,
            animationDuration: const Duration(seconds: 1),
            themeMode: themeNotifier.isDark ? ThemeMode.dark : ThemeMode.light,
            theme: themeNotifier.isDark
                ? ThemeData.dark()
                : ThemeData(primarySwatch: Colors.blueGrey),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
