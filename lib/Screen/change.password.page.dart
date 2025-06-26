import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/account.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/passwordUpdateBodyModel.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isNewPass = true;
  bool isConf = true;
  final newPassController = TextEditingController();
  final confirPassController = TextEditingController();

  void showDiologBox() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          child: Container(
            width: 327.w,
            height: 325.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Color(0xFFFEFEFE),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 18.w,
                right: 18.w,
                top: 28.h,
                // bottom: 28.h,
              ),
              child: Column(
                children: [
                  Container(
                    width: 131.w,
                    height: 131.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(76, 164, 207, 195),
                    ),
                    child: Center(
                      child: Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF15AC86),
                        ),
                        child: Center(
                          child: Container(
                            width: 50.67.w,
                            height: 60.31.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.done,
                                color: Color(0xFF292D32),
                                size: 40.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Password Changed!",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2A3A),
                      letterSpacing: -1,
                    ),
                  ),
                  Text(
                    "Your password is successfully Changed",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4F4F4F),
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => AccountPage()),
                      );
                    },
                    child: Container(
                      width: 291.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.95.r),
                        color: Color(0xFF15AC86),
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
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
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: bgColor),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Change Password",
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B2B2B),
                letterSpacing: -1,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Your new password must be unique from those previously used.",
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF868686),
                letterSpacing: -1,
              ),
            ),
            SizedBox(height: 30.h),
            TextFormField(
              controller: newPassController,
              obscureText: isNewPass == true ? isNewPass : false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.w),
                ),
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFFC8C8C8),
                  size: 24.sp,
                ),
                hintText: "New Password",
                hintStyle: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC8C8C8),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isNewPass = !isNewPass;
                    });
                  },
                  child:
                      isNewPass == true
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
            SizedBox(height: 15.h),
            TextFormField(
              controller: confirPassController,
              obscureText: isConf == true ? isConf : false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.w),
                ),
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFFC8C8C8),
                  size: 24.sp,
                ),
                hintText: "Confirm Password",
                hintStyle: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC8C8C8),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isConf = !isConf;
                    });
                  },
                  child:
                      isConf == true
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
            SizedBox(height: 36.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 327.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Center(
                  child: Text(
                    "Change Password",
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
    );
  }
}
