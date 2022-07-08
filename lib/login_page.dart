// import 'dart:html';

import 'package:flutter/material.dart';

import 'home_page.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://paytonepal.com/wp-content/uploads/2020/01/Wordlink_pay_to_nepal.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextFormField(
                  maxLength: 10,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null) {
                      return "Phone number required";
                    } else if (value.length < 10) {
                      return "Must contain 10 digits";
                    } else if (value.startsWith(
                      RegExp(r"[0-8]"),
                    )) {
                      return "Invalid Phone number";
                    } else if (value.startsWith(RegExp(r"[98][97]"))) {
                      _formKey.currentState!.validate();
                    }
                  },
                  decoration: const InputDecoration(
                    filled: false,
                    prefix: Text('+977'),
                    hintText: "Phone Number",
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await Future.delayed(const Duration(seconds: 1));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.blue),
                height: 50,
                width: 80,
                child: const Center(child: Text("Get OTP")),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              duration: const Duration(milliseconds: 1),
              height: 50,
              width: 100,
              child: const Icon(Icons.facebook),
            ),
            const SizedBox(
              height: 5,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1),
              height: 50,
              width: 100,
              child: const Icon(Icons.email),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
