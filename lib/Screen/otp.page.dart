import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:therapy_app/Screen/create.new.password.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/model/updatePasswordBodyModel.dart';

class OtpPage extends ConsumerStatefulWidget {
  final String otp;
  const OtpPage({super.key, required this.otp});

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  @override
  Widget build(BuildContext context) {
    final saveData = ref.watch(updatePasswordProvider);
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
                fieldWidth: 60.w,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                keyboardType: TextInputType.number,
                maxLength: 4,
                otpPinFieldDecoration: OtpPinFieldDecoration.custom,
                highlightBorder: true,
                otpPinFieldStyle: const OtpPinFieldStyle(
                  activeFieldBorderColor: Color(0xFF15AC86),
                  defaultFieldBorderColor: Color(0xFFC8C8C8),
                  fieldBorderRadius: 8,
                  fieldBorderWidth: 1.2,
                ),
                onSubmit: (text) {
                  ref.read(updatePasswordProvider.notifier).updateOtp(text);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder:
                          (context) =>
                              CreateNewPasswordPage(),
                    ),
                  );
                },
                onChange: (text) {},
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => CreateNewPasswordPage(),
                  //   ),
                  // );
                },
                child: Container(
                  width: 327.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Center(
                    child: Text(
                      "Verify",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 2.2),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t received code?",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B2B2B),
                        letterSpacing: -1,
                      ),
                    ),
                    Text(
                      "Resend",
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
    );
  }
}
