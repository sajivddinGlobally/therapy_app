import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/doctorHome.page.dart';

import 'package:therapy_app/Screen/login.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/therapy.png"),
          //SizedBox(height: 40.h),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => LoginPage()),
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
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       CupertinoPageRoute(builder: (context) => DoctorHomePage()),
          //     );
          //   },
          //   child: Center(
          //     child: Container(
          //       margin: EdgeInsets.only(top: 20.h),
          //       width: 327.w,
          //       height: 56.h,
          //       decoration: BoxDecoration(
          //         color: buttonColor,
          //         borderRadius: BorderRadius.circular(14.r),
          //       ),
          //       child: Center(
          //         child: Text(
          //           "Doctor",
          //           style: GoogleFonts.inter(
          //             fontSize: 16.sp,
          //             fontWeight: FontWeight.w500,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
