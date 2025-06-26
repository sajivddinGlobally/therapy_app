import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/otp.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/updatePasswordController.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final emailController = TextEditingController();
  bool sendOtp = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(updataProvider);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: bgColor),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text(
                  "Forgot Password?",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF868686),
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(height: 30.h),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide(
                        color: Color(0xFFC8C8C8),
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide(
                        color: Color(0xFFC8C8C8),
                        width: 1.w,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xFFC8C8C8),
                      size: 24.sp,
                    ),
                    hintText: "Email",
                    hintStyle: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFC8C8C8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$",
                    ).hasMatch(value)) {
                      return "Please Enter Valid Email Address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    try {
                      setState(() {
                        sendOtp = true;
                      });
                      await ref
                          .read(updataProvider.notifier)
                          .sendOTP(emailController.text);
                      Fluttertoast.showToast(
                        msg: "OTP Send your email",
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: buttonColor,
                        textColor: Color(0xFFFFFFFF),
                      );
                      setState(() {
                        sendOtp = false;
                      });

                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder:
                              (context) => OtpPage(email: emailController.text),
                        ),
                      );
                    } catch (e) {
                      setState(() {
                        sendOtp = false;
                      });
                      if (e is DioException) {
                        final data = e.response?.data;
                        String? extractedMessage;
                        if (data is Map<String, dynamic>) {
                          if (data.containsKey('message')) {
                            extractedMessage = data['message'];
                          } else if (data.containsKey('error')) {
                            final error = data['error'];
                            if (error is Map<String, dynamic>) {
                              extractedMessage = error.entries
                                  .map((e) => (e.value as List).join(", "))
                                  .join("\n");
                            }
                          }
                        }
                        if (extractedMessage != null) {
                          // Already shown by Dio interceptor
                          return; // ❌ Don’t show default "OTP don't send"
                        }
                      }
                      // ❗ If it's not Dio or custom message is not present, show generic message
                      Fluttertoast.showToast(
                        msg: "OTP don't send",
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: buttonColor,
                        textColor: Colors.white,
                      );

                      log(e.toString());
                    }
                  },
                  child: Container(
                    width: 327.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Center(
                      child:
                          sendOtp == false
                              ? Text(
                                "Send OTP",
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                              : CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 2.1),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Remember Password?",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2B2B2B),
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        "Login",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF15AC86),
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
