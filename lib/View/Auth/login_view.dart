// lib/views/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../View Model/auth_view_model.dart';
import '../../res/components/custom_button.dart';
import '../../res/components/custom_textfiled.dart';

class LoginScreen extends ConsumerWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authViewModel = ref.read(authProvider.notifier);
    final isPassVisible = ref.watch(passwordVisibleProvider);
    final isRememeber = ref.watch(rememeberPassProvider);

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/loginBg.png",
                height: 200,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome",
                          style: TextStyle(fontSize: 25),
                        ),
                        Image.asset("assets/images/c.png"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Please Sign in or Sign Up in CarbonCap",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    controller: emailController, hintText: "Enter your email"),
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
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Remember Password",
                          style: TextStyle(fontSize: 14),
                        ),
                        Checkbox(
                          value: isRememeber,
                          activeColor: Color(0xff52BF90),
                          onChanged: (value) {
                            ref.read(rememeberPassProvider.notifier).state =
                                value!;
                          },
                        )
                      ],
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      child: Text(
                        "Forgot Password?",
                      ),
                      onPressed: () {
                        // Navigate to Forgot Password Screen
                      },
                    ),
                    Spacer(), // Add a spacer to center the Sign Up button
                  ],
                ),
                SizedBox(height: 25),
                if (authState.isLoading) CircularProgressIndicator(),
                CustomButton(
                  text: "Login",
                  onPressed: () async {
                    final result =
                        await authViewModel.login(emailController.text);
                    if (result) {
                      Navigator.pushNamed(context, '/dashboard');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(authState.error!)),
                      );
                    }
                  },
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New in CarbonCap?"),
                    TextButton(
                        onPressed: () {
                          context.go('/signup');
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/share.png"),
                    Image.asset("assets/images/fb.png"),
                    Image.asset("assets/images/linkdin.png"),
                    Image.asset("assets/images/whatsapp.png"),
                    Image.asset("assets/images/insta.png"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
