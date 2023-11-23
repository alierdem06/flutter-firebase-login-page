import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/login/service/auth_service.dart';
import 'package:firebase_login/login/view/home_page.dart';
import 'package:firebase_login/widget/custom_show_dialog.dart';
import 'package:firebase_login/widget/custum_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  late String email, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAut = FirebaseAuth.instance;
  final authService = AuthService();
  final String backImage = "asset/images/login.jpeg";
  final String guestBtnTitle = "Guest login";
  final String forgotBtnTitle = "I forgot my password!";
  final String isEmptyTitle = "Fill out the information completely";
  final String eMailLabelText = "Email";
  final String passwordLabelText = "Password";
  final String successErrorTitle = "success";
  final String signUpRouteTitle = "/signUp";
  final String signInTitle = "Sign In";
  final String signUpTitle = "Sign Up";

  final String homePgRouteTitle = "/homePage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  backImage,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      customSizedBox(height: 90),
                      titleText(),
                      customSizedBox(),
                      emailTextFormField(),
                      passwordTextFormField(),
                      customSizedBox(),
                      forgotButton(),
                      customSizedBox(),
                      CustomElevatedButton(onPressed: signIn, buttonText: signInTitle),
                      customSizedBox(),
                      CustomElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, signUpRouteTitle), buttonText: signUpTitle),
                      customSizedBox(),
                      CustomElevatedButton(
                          onPressed: () async {
                            final result = await authService.signInAnonymous();
                            if (result != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(context, homePgRouteTitle);
                            } else {
                              // ignore: use_build_context_synchronously
                              showCustomDialog(context, result);
                            }
                          },
                          buttonText: guestBtnTitle),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final result = await authService.signIn(email, password);
      if (result == successErrorTitle) {
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
      } else {
        // ignore: use_build_context_synchronously
        showCustomDialog(context, result!);
      }
    }
  }

  TextButton forgotButton() {
    return TextButton(
      onPressed: () {},
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          forgotBtnTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return isEmptyTitle;
        } else {
          return null;
        }
      },
      onSaved: (value) {
        password = value!;
      },
      textInputAction: TextInputAction.done,
      obscureText: !_isPasswordVisible,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: passwordLabelText,
        labelStyle: const TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      autocorrect: true,
      cursorColor: Colors.white,
      autofocus: true,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return isEmptyTitle;
        } else {
          return null;
        }
      },
      onSaved: (value) {
        email = value!;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: eMailLabelText,
        labelStyle: const TextStyle(color: Colors.grey),
      ),
      autocorrect: true,
      cursorColor: Colors.white,
      autofocus: true,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  Center titleText() {
    return const Center(
      child: Text(
        "Welcome",
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Widget customSizedBox({double height = 20.0}) {
  return SizedBox(
    height: height,
  );
}
