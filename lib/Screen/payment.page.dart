import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/add.new.card.page.dart';
import 'package:therapy_app/Screen/appoinment.page.dart';
import 'package:therapy_app/Screen/home.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/bookBodyModel.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key});

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  void showDiologBox() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          child: Container(
            width: 327.w,
            height: 400.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
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
                  Center(
                    child: Text(
                      "Congratulations ",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C2A3A),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Your appointment with Dr. David Patel is confirmed for June 30, 2023, at 10:00 AM.",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4F4F4F),
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => AppoinmentPage(),
                        ),
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
                          "View Appointment ",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Back to Home",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF15AC86),
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

  int tab = 0;
  bool isLoading = false;
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
                // Navigator.push(
                //   context,
                //   CupertinoPageRoute(builder: (context) => AddNewCardPage()),
                // );
              },
              child: PayBody(
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
              child: UpiBody(
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
              child: UpiBody(
                image: "assets/pa.png",
                txt: "Paypal",
                bgColor: tab == 2 ? buttonColor : Colors.transparent,
                bordercolor: tab != 2 ? Color(0xFF4F4F4F) : Colors.transparent,
              ),
            ),
            SizedBox(height: 14.h),
            const PayBody(image: "assets/upi.png", txt: "UPI"),
            SizedBox(height: MediaQuery.of(context).size.height / 2.6),
            GestureDetector(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                try {
                  final body = BookBodyModel(
                    status: "completed",
                    date: DateTime.now(),
                    timeSlot: "timeSlot",
                    paymentMethod: "paymentMethod".toString(),
                    therapistId: '5',
                  );
                  final service = ApiStateNetwork(createDio());
                  final response = await service.book(body);
                  if (response != null) {
                    showDiologBox();
                    setState(() {
                      isLoading = false;
                    });
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                    Fluttertoast.showToast(msg: "something went wrong");
                  }
                } catch (e) {
                  log(e.toString());
                  Fluttertoast.showToast(msg: e.toString());
                }
              },
              child: Container(
                width: 327.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFF15AC86),
                ),
                child: Center(
                  child:
                      isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
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

class PayBody extends StatelessWidget {
  final String image;
  final String txt;
  const PayBody({super.key, required this.image, required this.txt});

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

class UpiBody extends StatefulWidget {
  final String image;
  final String txt;
  final Color bgColor;
  final Color bordercolor;
  const UpiBody({
    super.key,
    required this.image,
    required this.txt,
    required this.bgColor,
    required this.bordercolor,
  });

  @override
  State<UpiBody> createState() => _UpiBodyState();
}

class _UpiBodyState extends State<UpiBody> {
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
