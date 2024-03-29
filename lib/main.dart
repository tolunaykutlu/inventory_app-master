import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory_app/firebase_options.dart';
import 'package:inventory_app/screens/login_page.dart';
import 'package:inventory_app/screens/main_page.dart';
import 'package:inventory_app/screens/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => FirebaseAuth.instance.currentUser == null
            ? const LoginPageView()
            : const MainPage()),
    GoRoute(
      path: '/Sign',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/mainPage',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/Login',
      builder: (context, state) => const LoginPageView(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        title: 'Demo',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black)),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.grey[500],
              selectedItemColor: Colors.white,
              selectedIconTheme: const IconThemeData(color: Colors.green)),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              foregroundColor: Colors.white, backgroundColor: Colors.black),
          useMaterial3: true,
        ));
  }
}
