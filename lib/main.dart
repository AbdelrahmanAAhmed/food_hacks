import 'package:flutter/material.dart';
import 'package:food_hacks/views/sign_page.dart';
import 'package:food_hacks/views/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const FoodHacks());
}

class FoodHacks extends StatelessWidget {
  const FoodHacks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'Sign Up': (context) => SignUpPage(),
        'Sign in': (context) => SignPage()
      },
      initialRoute: 'Sign in',
    );
  }
}
