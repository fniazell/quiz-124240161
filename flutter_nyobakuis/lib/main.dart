import 'dart:async';

import 'package:flutter/material.dart';

import 'login_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class SessionManager {
  static Timer? _timer;
  static bool isLoggedIn = false;
  static const Duration timeout = Duration(minutes: 1);

  static void startSession() {
    isLoggedIn = true;
    resetTimer();
  }

  static void endSession({bool showMessage = false}) {
    isLoggedIn = false;
    _timer?.cancel();

    if (showMessage && navigatorKey.currentContext != null) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text(
            'Sesi telah berakhir karena tidak ada aktivitas. Silakan login kembali.',
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }

    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  static void resetTimer() {
    if (!isLoggedIn) return;
    _timer?.cancel();
    _timer = Timer(timeout, () {
      if (isLoggedIn) {
        endSession(showMessage: true);
      }
    });
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color kCharcoal = Color(0xFF1E1E2C);
  static const Color kSurface = Color(0xFFF7F5F2);
  static const Color kAmber = Color(0xFFE8A838);
  static const Color kAmberDark = Color(0xFFD4922A);
  static const Color kSlate = Color(0xFF6B7280);
  static const Color kCardBg = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => SessionManager.resetTimer(),
      onPointerMove: (_) => SessionManager.resetTimer(),
      onPointerUp: (_) => SessionManager.resetTimer(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Culinarizz',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kSurface,
          colorScheme: ColorScheme.fromSeed(
            seedColor: kAmber,
            brightness: Brightness.light,
            primary: kCharcoal,
            secondary: kAmber,
            surface: kSurface,
          ),
          useMaterial3: true,
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(
            centerTitle: false,
            elevation: 0,
            foregroundColor: kCharcoal,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            titleTextStyle: TextStyle(
              color: kCharcoal,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kCharcoal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: kAmber, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
            labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          ),
          cardTheme: CardThemeData(
            elevation: 0,
            color: kCardBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            clipBehavior: Clip.antiAlias,
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
