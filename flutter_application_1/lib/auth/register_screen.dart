import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_services.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Account"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hint: "Full Name",
                icon: Icons.person,
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Full name is required";
                  }
                  if (value.length < 3) {
                    return "Name too short";
                  }
                  return null;
                },
              ),

              CustomTextField(
                hint: "Email",
                icon: Icons.email,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),

              CustomTextField(
                hint: "Password",
                icon: Icons.lock,
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              dropdownButton(
                items:const[
                  DropdownMenuItem(child: Text("User"), value: "user"),
                  DropdownMenuItem(child: Text("Admin"), value: "admin"),
                ]
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final result = await AuthService.register(
                        nameController.text.trim(),
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );

                      if (result["message"] == "User registered successfully") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Registration successful"),
                          ),
                        );
                        Navigator.pop(context); // back to login
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(result["message"])),
                        );
                      }
                    }
                  },

                  child: const Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
