import 'package:flutter/material.dart';
import 'package:owala_app/utils/consts.dart';
import 'package:owala_app/utils/validators.dart';
import 'package:owala_app/views/auth/components/auth_button.dart';
import 'package:owala_app/views/auth/components/auth_form_field.dart';
import 'package:owala_app/views/auth/components/social_auth_button.dart';

class LoginScreen extends StatelessWidget {
  // fungsinya untuk memanggil sebuah validator dari setiap form
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: textColor
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter a form to login to this app",
              style: TextStyle(
                fontSize: 16,
                color: textColor
              ),
            ),
            SizedBox(height: 60),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthFormField(
                    controller: _emailController,
                    label: "Email",
                    hintText: "Enter your Email",
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _passwordController,
                    label: "Password",
                    hintText: "Enter your password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility_off),
                    validator: Validators.validatePassword,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password"),
                    ),
                  ),
                  SizedBox(height: 20),
                  AuthButton(
                    text: "Sign In",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/catalogue');
                      }
                    },
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Divider(
                        thickness: 1,
                        color: textColor,
                      )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "or",
                          style: TextStyle(
                            color: textColor
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: textColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  SocialAuthButton(
                    assetIcon: "assets/icons/google_logo.svg",
                    label: "Sign In with Google",
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),
                  SocialAuthButton(
                    assetIcon: "assets/icons/apple_logo.svg",
                    label: "Sign In with Apple",
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    onPressed: () {},
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: textColor
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/register'),
                        child: Text("Register"),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}