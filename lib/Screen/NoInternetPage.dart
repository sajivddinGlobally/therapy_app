import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF741A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/yatralogo.png",
              width: 123.w,
              height: 176.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 18.h),
            Text(
              "Ooops!",
              style: GoogleFonts.inter(
                fontSize: 56.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xffFFFFFF),
                letterSpacing: -1,
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              width: 220.w,
              child: Text(
                textAlign: TextAlign.center,
                "No Internet Connction found Checkyour Connection",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFFFF),
                  letterSpacing: -1,
                  height: 1.3,
                ),
              ),
            ),
            SizedBox(height: 46.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                minimumSize: Size(171.w, 51.h),
                backgroundColor: Color(0xffFFFFFF),
              ),
              onPressed: () {},
              child: Text(
                "Try Again",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFF741A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
