import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/payment.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class AvailableTherapyPage extends StatefulWidget {
  const AvailableTherapyPage({super.key});

  @override
  State<AvailableTherapyPage> createState() => _AvailableTherapyPageState();
}

class _AvailableTherapyPageState extends State<AvailableTherapyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Available Therapist",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Column(
          children: [
            SizedBox(height: 22.h),
            Container(
              padding: EdgeInsets.only(
                left: 14.w,
                right: 14.w,
                top: 14.h,
                bottom: 14.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Color(0xFFF4F6F9),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 70.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.blueGrey,
                        ),
                        child: Image.asset("assets/dot.png", fit: BoxFit.cover),
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Aaron ",
                            style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2B2B2B),
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            "Certified Therapist ",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF868686),
                              letterSpacing: -1,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Icon(Icons.star, color: buttonColor, size: 15.sp),
                              Icon(Icons.star, color: buttonColor, size: 15.sp),
                              Icon(Icons.star, color: buttonColor, size: 15.sp),
                              Icon(Icons.star, color: buttonColor, size: 15.sp),
                              Icon(Icons.star, color: buttonColor, size: 15.sp),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "View Profile ",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: buttonColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 144.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0xFFFFFFFF),
                          border: Border.all(
                            color: Color(0xFF15AC86),
                            width: 1.w,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Find Other",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF15AC86),
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => PaymentPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 144.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color(0xFF15AC86),
                          ),
                          child: Center(
                            child: Text(
                              "Book Appointment",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFFFFFF),
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
