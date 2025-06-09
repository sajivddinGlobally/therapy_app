import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/chat.inbox.page.dart';
import 'package:therapy_app/Screen/reshedule.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class AppoinmentPage extends StatefulWidget {
  const AppoinmentPage({super.key});

  @override
  State<AppoinmentPage> createState() => _AppoinmentPageState();
}

class _AppoinmentPageState extends State<AppoinmentPage> {
  int defaultab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: Text(
          "My Appointments",
          style: GoogleFonts.nunito(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2B2B2B),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: DefaultTabController(
          initialIndex: defaultab,
          length: 2,
          child: Column(
            children: [
              TabBar(
                dividerColor: Color(0xFF868686),
                indicatorColor: buttonColor,
                indicatorWeight: 4.w,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Color(0xFF4F4F4F),
                labelStyle: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: buttonColor,
                  letterSpacing: -1,
                ),

                onTap: (value) {
                  setState(() {
                    defaultab = value;
                  });
                },
                tabs: [
                  Tab(
                    child: Text(
                      "Upcoming",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Past",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              // Add Expanded here to avoid unbounded height error
              Expanded(
                child: TabBarView(
                  children: [
                    // Upcoming Tab
                    Column(
                      children: [
                        PastBody(
                          status: "Scheduled",
                          button1: "Reschedule",
                          button2: "Join Chat",
                          callback: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ChatInboxPage(),
                              ),
                            );
                          },
                          statusColor: Color(0xFF00BAF7),
                          voidCallback: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ReshedulePage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    // Past Tab
                    SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: 16.h,
                      ), // Optional padding
                      child: Column(
                        children: [
                          PastBody(
                            status: "Cancel",
                            button1: "Book Again",
                            button2: "Leave a review",
                            statusColor: Color(0xFFE33556),
                            voidCallback: () {},
                            callback: () {},
                          ),
                          SizedBox(height: 14.h),
                          PastBody(
                            status: "Complete",
                            button1: "Book Again",
                            button2: "Leave a review",
                            statusColor: Color(0xFF00BAF7),
                            voidCallback: () {},
                            callback: () {},
                          ),
                          SizedBox(height: 14.h),
                          PastBody(
                            status: "Complete",
                            button1: "Book Again",
                            button2: "Leave a review",
                            statusColor: Color(0xFF00BAF7),
                            voidCallback: () {},
                            callback: () {},
                          ),
                        ],
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

class PastBody extends StatelessWidget {
  final String status;
  final String button1;
  final String button2;
  final Color statusColor;
  final Function voidCallback;
  final Function callback;
  const PastBody({
    super.key,
    required this.status,
    required this.button1,
    required this.button2,
    required this.statusColor,
    required this.voidCallback,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 14.w,
        right: 14.w,
        top: 14.h,
        bottom: 14.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dr. Aaron",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2B2B2B),
                      letterSpacing: -1,
                    ),
                  ),
                  Text(
                    "Today, 07:00 PM",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF868686),
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 2.h,
                      bottom: 2.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: Color(0xFFE6F7FE),
                    ),
                    child: Text(
                      status,
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: statusColor,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: 42.w,
                height: 42.h,
                decoration: BoxDecoration(
                  color: Color(0xFFE5EEF8),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xFF15AC86),
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(
            color: Colors.grey,
            thickness: 1.w,
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  voidCallback();
                },
                child: Container(
                  width: 144.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xFFFFFFFF),
                    border: Border.all(color: Color(0xFF15AC86), width: 1.w),
                  ),
                  child: Center(
                    child: Text(
                      button1,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF15AC86),
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () {
                  callback();
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
                      button2,
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
    );
  }
}
