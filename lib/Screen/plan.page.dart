import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/reshedule.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Therapy Plan",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  tab = 0;
                });
              },
              child: planBody(
                plan: "₹ 999/1 Session",
                bgColor: tab == 0 ? Color(0xFFE5EEF8) : Colors.transparent,
                contai: tab == 0 ? Color(0xFF15AC86) : Colors.transparent,
                bordercolor: tab == 0 ? Colors.transparent : Color(0xFFC5C6CC),
              ),
            ),
            SizedBox(height: 14.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  tab = 1;
                });
              },
              child: planBody(
                plan: "₹ 2499/3 Sessions",
                bgColor: tab == 1 ? Color(0xFFE5EEF8) : Colors.transparent,
                contai: tab == 1 ? Color(0xFF15AC86) : Colors.transparent,
                bordercolor: tab == 1 ? Colors.transparent : Color(0xFFC5C6CC),
              ),
            ),
            SizedBox(height: 14.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  tab = 2;
                });
              },
              child: planBody(
                plan: "₹ 6499/8 Session",
                bgColor: tab == 2 ? Color(0xFFE5EEF8) : Colors.transparent,
                contai: tab == 2 ? Color(0xFF15AC86) : Colors.transparent,
                bordercolor: tab == 2 ? Colors.transparent : Color(0xFFC5C6CC),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 2.22),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ReshedulePage()),
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
          ],
        ),
      ),
    );
  }
}

class planBody extends StatelessWidget {
  final String plan;
  final Color bgColor;
  final Color contai;
  final Color bordercolor;
  const planBody({
    super.key,
    required this.plan,
    required this.bgColor,
    required this.contai,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: 23.h,
        bottom: 23.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: bgColor,
        border: Border.all(color: Color(0xFFF4F6F9), width: 1.w),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Container(
            width: 16.w,
            height: 16.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: contai,
              border: Border.all(color: bordercolor, width: 1.5.w),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            plan,
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2024),
              letterSpacing: -1,
            ),
          ),
        ],
      ),
    );
  }
}
