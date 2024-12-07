import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mytask/res/components/custom_button.dart';
import 'package:pinput/pinput.dart';

import '../../View Model/auth_view_model.dart';

class OtpScreen extends ConsumerWidget {
  // Controller to handle OTP input value
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authViewModel = ref.read(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Image.asset(
          "assets/images/c.png",
          height: 30,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Title for OTP section
              const Text(
                "Verification Code",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "We have sent the 4-digit Verification code to your Phone Number and Email Address",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "abc@gmail.com and 0349*****32",
                    style: TextStyle(color: Color(0xff52BF90)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // OTP Input
              Pinput(
                controller: _otpController,
                length: 4, // Number of digits to input

                keyboardType: TextInputType.number,
                onCompleted: (pin) {
                  // Handle OTP submission logic
                  print('Entered OTP: $pin');
                },

                defaultPinTheme: PinTheme(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                      )
                    ],
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(
                height: 500,
              ),
              Row(
                children: [
                  CustomButton(
                      borderRadius: 15,
                      color: Colors.grey.shade200,
                      textColor: Colors.black54,
                      width: 160,
                      height: 50,
                      text: "Resend",
                      onPressed: () {}),
                  const SizedBox(width: 15),
                  CustomButton(
                      borderRadius: 15,
                      width: 160,
                      height: 50,
                      text: "Verify",
                      onPressed: () async {
                        log("on tapped");
                        final result =
                            await authViewModel.verifyOtp(_otpController.text);
                        log("$result");
                        if (result) {
                          context.go('/dashboard');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text(authState.error ?? "Signup failed")),
                          );
                        }
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
