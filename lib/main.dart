import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/firebase_options.dart';
import 'package:firebase_login/login/view/home_page.dart';
import 'package:firebase_login/login/view/login_page.dart';
import 'package:firebase_login/login/view/sign_up.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/loginPage": (context) => const LoginPage(),
        "/signUp": (context) => const SignUp(),
        "/homePage": (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
