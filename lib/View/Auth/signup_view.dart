// lib/views/signup_screen.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mytask/View%20Model/auth_view_model.dart';
import 'package:mytask/main.dart';
import 'package:mytask/res/components/custom_button.dart';
import 'package:mytask/res/components/custom_textfiled.dart';

class SignupScreen extends ConsumerWidget {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authViewModel = ref.read(authProvider.notifier);
    final isPassVisible = ref.watch(passwordVisibleProvider);
    final approveTerms = ref.watch(termAndConditonProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: Image.asset("assets/images/c.png"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              CustomTextField(
                controller: nameController,
                hintText: "First name",
              ),
              CustomTextField(
                controller: lastNameController,
                hintText: "Last name",
              ),
              CustomTextField(
                  controller: emailController, hintText: "Enter your Email*"),
              CustomTextField(
                  controller: phoneController, hintText: "Enter your Phone*"),
              CustomTextField(
                  controller: addressController,
                  hintText: "Enter your Address*"),
              CustomTextField(
                  controller: genderController, hintText: "Select Gender"),
              CustomTextField(
                controller: passwordController,
                hintText: "Enter your Password",
                obscureText:
                    !isPassVisible, // Invert the value for visibility toggle
                suffixIcon: GestureDetector(
                  onTap: () {
                    ref.read(passwordVisibleProvider.notifier).state =
                        !isPassVisible;
                  },
                  child: Icon(
                    isPassVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              CustomTextField(
                controller: confirmPasswordController,
                hintText: "Enter your Confirm Password",
                obscureText:
                    !isPassVisible, // Invert the value for visibility toggle
                suffixIcon: GestureDetector(
                  onTap: () {
                    ref.read(passwordVisibleProvider.notifier).state =
                        !isPassVisible;
                  },
                  child: Icon(
                    isPassVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "I agree with terms and condition",
                    style: TextStyle(fontSize: 14),
                  ),
                  Checkbox(
                    value: approveTerms,
                    activeColor: Color(0xff52BF90),
                    onChanged: (value) {
                      ref.read(termAndConditonProvider.notifier).state = value!;
                    },
                  )
                ],
              ),
              if (authState.isLoading) CircularProgressIndicator(),
              CustomButton(
                text: "Next",
                onPressed: () async {
                  log("on tapped");
                  final result = await authViewModel.signup(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                  if (result) {
                    context.go('/otp');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(authState.error ?? "Signup failed")),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        context.go('/');
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff52BF90)),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
