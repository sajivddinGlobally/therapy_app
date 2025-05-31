import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/add.new.card.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Payment Methods",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
            letterSpacing: -1,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.h),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => AddNewCardPage()),
                );
              },
              child: payBody(
                image: "assets/credit.png",
                txt: "Credit/Debit Card",
              ),
            ),
            SizedBox(height: 14.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  tab = 1;
                });
              },
              child: upiBody(
                image: "assets/goog.png",
                txt: "Gpay",
                bgColor: tab == 1 ? buttonColor : Colors.transparent,
                bordercolor: tab != 1 ? Color(0xFF4F4F4F) : Colors.transparent,
              ),
            ),
            SizedBox(height: 14.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  tab = 2;
                });
              },
              child: upiBody(
                image: "assets/pa.png",
                txt: "Paypal",
                bgColor: tab == 2 ? buttonColor : Colors.transparent,
                bordercolor: tab != 2 ? Color(0xFF4F4F4F) : Colors.transparent,
              ),
            ),
            SizedBox(height: 14.h),
            payBody(image: "assets/upi.png", txt: "UPI"),
            SizedBox(height: MediaQuery.of(context).size.height / 2.6),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 327.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFF15AC86),
                ),
                child: Center(
                  child: Text(
                    "Confirm",
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
      ),
    );
  }
}

class payBody extends StatelessWidget {
  final String image;
  final String txt;
  const payBody({super.key, required this.image, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Color(0xFFF4F6F9),
      ),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          Image.asset(image),
          SizedBox(width: 10.w),
          Text(
            txt,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2024),
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Color(0xFF4F4F4F),
            size: 20.sp,
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}

class upiBody extends StatefulWidget {
  final String image;
  final String txt;
  final Color bgColor;
  final Color bordercolor;
  const upiBody({
    super.key,
    required this.image,
    required this.txt,
    required this.bgColor,
    required this.bordercolor,
  });

  @override
  State<upiBody> createState() => _upiBodyState();
}

class _upiBodyState extends State<upiBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Color(0xFFF4F6F9),
      ),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          Image.asset(widget.image),
          SizedBox(width: 10.w),
          Text(
            widget.txt,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2024),
            ),
          ),
          Spacer(),
          Container(
            width: 16.w,
            height: 16.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: widget.bordercolor, width: 1.5.w),
              color: widget.bgColor,
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}
