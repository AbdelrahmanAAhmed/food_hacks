import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hacks/Widgets/custom_Text_Field.dart';
import 'package:food_hacks/Widgets/custom_buttom.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignPage extends StatefulWidget {
  SignPage({super.key});

  static String id = 'Sign in';

  @override
  State<SignPage> createState() => _SignPageState();
}

GlobalKey<FormState> formKey = GlobalKey();
String? email;
String? password;
bool isLoading = false;

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                    ),
                    const Icon(
                      Icons.food_bank,
                      color: Color(0xff0438BF),
                      size: 60,
                    ),
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0438BF)),
                    ),
                    const Text(
                      'Sign To Continue',
                      style: TextStyle(color: Color(0xffB3B2E1)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                      prefixIcon:
                          const Icon(Icons.email, color: Color(0xff0DD2FD)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password',
                        prefixIcon:
                            const Icon(Icons.lock, color: Color(0xff0DD2FD))),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await loginUser();
                            showSnackBar(context, 'Succses');
                            Navigator.pushNamed(context, 'Home Page');
                          } on FirebaseAuthException catch (ex) {
                            showSnackBar(context, ex.toString());
                          } catch (ex) {
                            showSnackBar(context, 'There Was An Error');
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                      child: CustomButtom(text: 'Sign In'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Row(
                        children: [
                          const Text('Dont Have Account ?'),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'Sign Up');
                            },
                            child: const Text(
                              '  Create a new account',
                              style: TextStyle(color: Color(0xff0F42C1)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
