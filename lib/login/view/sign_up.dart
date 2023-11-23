import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/login/view/login_page.dart';

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordVisible = false;
  late String email, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAut = FirebaseAuth.instance;
  final String backImage = "asset/images/login.jpeg";
  final String isEmptyTitle = "Fill out the information completely";
  final String eMailLabelText = "Email";
  final String passwordLabelText = "Password";
  final String createTitle = "Create Account";
  final String rtnLgnPage = "Return to login page";
  final String routeRtnLgnPage = "/loginPage";

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
                      _signUpButton(),
                      customSizedBox(),
                      returnLgnPage()
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

  ElevatedButton _signUpButton() {
    String? res;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          formKey.currentState!.reset();

          try {
            final userResult = await firebaseAut.createUserWithEmailAndPassword(email: email, password: password);
            User? user = userResult.user;
            res = "registration successful : ${user?.email}";
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, routeRtnLgnPage);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              res = "Weak password!";
            } else if (e.code == 'email-already-in-use') {
              res = "This email address is already in use";
            } else {
              res = e.message;
            }
          }
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(res.toString()),
            ),
          );
        }
      },
      child: Text(
        createTitle,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  ElevatedButton returnLgnPage() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
      ),
      onPressed: () => Navigator.pushNamed(context, "/loginPage"),
      child: Text(
        rtnLgnPage,
        style: const TextStyle(color: Colors.white),
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
