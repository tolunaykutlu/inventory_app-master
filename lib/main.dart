import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/firebase_options.dart';
import 'package:inventory_app/screens/login_page.dart';
import 'package:inventory_app/screens/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.grey[500],
              selectedItemColor: Colors.green),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              foregroundColor: Colors.white, backgroundColor: Colors.black),
          useMaterial3: true,
        ),
        home: const LoginPageView());
  }
}
