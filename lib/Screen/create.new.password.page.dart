import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/login.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/passUpdateSuccBodyModel.dart';
import 'package:therapy_app/data/model/passUpdateSuccResModel.dart';
import 'package:therapy_app/data/model/updatePasswordBodyModel.dart';
import 'package:therapy_app/data/model/updatePasswordResModel.dart';

class CreateNewPasswordPage extends ConsumerStatefulWidget {
  final String ot;
  final String em;
  const CreateNewPasswordPage({super.key, required this.ot, required this.em});

  @override
  ConsumerState<CreateNewPasswordPage> createState() =>
      _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends ConsumerState<CreateNewPasswordPage> {
  bool isNewPass = true;
  bool isConf = true;
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoder = false;

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
                        CupertinoPageRoute(builder: (context) => LoginPage()),
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
                          "Login Now ",
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
    final password = ref.watch(updatePasswordProvider);
    final passwordData = ref.watch(updatePasswordProvider.notifier);
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
              "Create new password",
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B2B2B),
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
              controller: newPasswordController,
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
              controller: confirmPasswordController,
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
            SizedBox(height: 38.h),
            GestureDetector(
              onTap: () async {
                // setState(() {
                //   isLoder = true;
                // });
                // final service = ApiStateNetwork(await createDio());
                // try {
                //   PassUpdateResSuccModel resSuccModel = await service
                //       .passwordUpdate(
                //         PassUpdateBodySuccModel(
                //           email: password.email,
                //           otp: password.otp,
                //           password: newPasswordController.text,
                //           passwordConfirmation: confirmPasswordController.text,
                //         ),
                //       );
                //   showDiologBox();
                //   Fluttertoast.showToast(msg: "Password updated succesfully");
                // } catch (e) {
                //   Fluttertoast.showToast(msg: "Invalid OTP");
                // }
                try {
                  final body = PassUpdateBodySuccModel(
                    email: widget.em,
                    otp: widget.ot,
                    password: newPasswordController.text,
                    passwordConfirmation: confirmPasswordController.text,
                  );
                  final serivce = ApiStateNetwork(createDio());
                  final resp = await serivce.passwordUpdate(body);
                  if (resp != null) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => LoginPage()),
                    );
                  } else {
                    Fluttertoast.showToast(msg: "wsdaf");
                    log(resp.message);
                  }
                } catch (e) {
                  Fluttertoast.showToast(msg: "///////////////////");
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
                  child: Text(
                    "Reset Password",
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
