import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mytask/View/Auth/login_view.dart';
import 'package:mytask/View/dashboard_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'View/Auth/otp_screen.dart';
import 'View/Auth/signup_view.dart';

void main() {
  runApp(
    ProviderScope(
      // Wrap the app in ProviderScope
      child: MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),
    GoRoute(path: '/otp', builder: (context, state) => OtpScreen()),
    GoRoute(path: '/dashboard', builder: (context, state) => DashboardView()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      routerConfig: _router,
    );
  }
}
