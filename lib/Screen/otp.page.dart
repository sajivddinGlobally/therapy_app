import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:therapy_app/Screen/create.new.password.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/updatePasswordController.dart';

class OtpPage extends ConsumerStatefulWidget {
  final String email;
  const OtpPage({super.key, required this.email});

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  String otp = '';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(updataProvider);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: bgColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Text(
                "OTP Verification",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B2B2B),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Enter the verification code we just sent on your email address.",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF868686),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 30.h),
              OtpPinField(
                fieldHeight: 50.h,
                fieldWidth: 40.w,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                keyboardType: TextInputType.number,
                maxLength: 6,
                otpPinFieldDecoration: OtpPinFieldDecoration.custom,
                highlightBorder: true,
                otpPinFieldStyle: const OtpPinFieldStyle(
                  activeFieldBorderColor: Color(0xFF15AC86),
                  defaultFieldBorderColor: Color(0xFFC8C8C8),
                  fieldBorderRadius: 8,
                  fieldBorderWidth: 1.2,
                ),
                onSubmit: (text) async {
                  try {
                    final result = await ref
                        .read(updataProvider.notifier)
                        .updatePassword(
                          widget.email,
                          text,
                          "Dummy@1234",
                          "Dummy@1234",
                        );

                    // If we reach here, OTP is correct
                    Fluttertoast.showToast(
                      msg: "OTP verify successful",
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: buttonColor,
                      textColor: Colors.white,
                    );
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder:
                            (context) => CreateNewPasswordPage(
                              otp: text,
                              email: widget.email,
                            ),
                      ),
                    );
                  } catch (e) {
                    // Error comes only if OTP is invalid
                    log("OTP verification failed: $e");
                  }
                },
                onChange: (text) {
                  setState(() {
                    otp = text;
                  });
                },
              ),
              SizedBox(height: 30.h),
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     width: 327.w,
              //     height: 56.h,
              //     decoration: BoxDecoration(
              //       color: buttonColor,
              //       borderRadius: BorderRadius.circular(14.r),
              //     ),
              //     child: Center(
              //       child: Text(
              //         "Verify",
              //         style: GoogleFonts.inter(
              //           fontSize: 16.sp,
              //           fontWeight: FontWeight.w500,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: MediaQuery.of(context).size.height / 2.2),
              // Center(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         "Didn’t received code?",
              //         style: GoogleFonts.inter(
              //           fontSize: 16.sp,
              //           fontWeight: FontWeight.w500,
              //           color: Color(0xFF2B2B2B),
              //           letterSpacing: -1,
              //         ),
              //       ),
              //       Text(
              //         "Resend",
              //         style: GoogleFonts.inter(
              //           fontSize: 16.sp,
              //           fontWeight: FontWeight.w500,
              //           color: Color(0xFF15AC86),
              //           letterSpacing: -1,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
