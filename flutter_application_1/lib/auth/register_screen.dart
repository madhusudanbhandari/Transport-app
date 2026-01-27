import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Account"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomTextField(hint: "Full Name", icon: Icons.person),

            CustomTextField(hint: "Email", icon: Icons.email),

            CustomTextField(
              hint: "Password",
              icon: Icons.lock,
              obscureText: true,
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: null, child: Text("Register")),
            ),
          ],
        ),
      ),
    );
  }
}
