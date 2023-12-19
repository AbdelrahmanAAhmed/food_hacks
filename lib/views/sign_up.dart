// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hacks/Widgets/custom_Text_Field.dart';
import 'package:food_hacks/Widgets/custom_buttom.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  static String id = 'Sign Up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: const Color(0xff0438BF),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0438BF),
                      ),
                    ),
                    const Text(
                      'Create a new ccount',
                      style: TextStyle(color: Color(0xffB3B2E1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Name',
                      prefixIcon: const Icon(
                        Icons.person_2_outlined,
                        color: Color(0xff0DD2FD),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xff0DD2FD),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Phone',
                      prefixIcon:
                          const Icon(Icons.phone, color: Color(0xff0DD2FD)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Password',
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xff0DD2FD)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Confirm Password',
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xff0DD2FD)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButtom(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await registerUser();
                            showSnackBar(context, 'Succses');
                          } on FirebaseAuthException catch (ex) {
                            showSnackBar(context, ex.toString());
                          } catch (ex) {
                            showSnackBar(context, 'There Was An Error');
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                      text: 'Create Account',
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already Have Account ?'),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'Sign in');
                            },
                            child: const Text(
                              '  Sign In',
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

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
