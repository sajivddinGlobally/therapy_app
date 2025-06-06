import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/login.page.dart';
import 'package:therapy_app/Screen/profile.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
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
                "Hello! Register to get started",
                style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2B2B2B),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 30.h),
              Center(
                child: Column(
                  children: [
                    TextFormField(
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
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      obscureText: isSecure == true ? isSecure : false,
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
                          Icons.lock_outline_rounded,
                          color: Color(0xFFC8C8C8),
                          size: 24.sp,
                        ),
                        hintText: "Password",
                        hintStyle: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFC8C8C8),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSecure = !isSecure;
                            });
                          },
                          child:
                              isSecure == true
                                  ? Icon(
                                    Icons.visibility_off_outlined,
                                    color: Color(0xFFC8C8C8),
                                    size: 24.sp,
                                  )
                                  : Icon(
                                    Icons.visibility_outlined,
                                    color: Color(0xFFC8C8C8),
                                    size: 24.sp,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
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
                            "Register ",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Color(0xFFC8C8C8),
                      thickness: 1.w,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "Or Register with",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF868686),
                      letterSpacing: -1,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color(0xFFC8C8C8),
                      thickness: 1.w,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Body(image: 'assets/f.png'),
                  Body(image: 'assets/goog.png'),
                  Body(image: 'assets/apple.png'),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3.2),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        "Login Now",
                        style: GoogleFonts.nunito(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF15AC86),
                        ),
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
