import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/constant/myColor.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({super.key});

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  int tabBo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Cardiologist",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Row(
                children: [
                  Container(
                    width: 96.w,
                    height: 96.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey,
                      image: DecorationImage(
                        image: AssetImage("assets/doctor2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Emma Kathrin",
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF101623),
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        "Cardiologist",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: buttonColor,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        "MBBS",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8C8C8C),
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xFFFFBA55)),
                          SizedBox(width: 6.w),
                          Text(
                            "4.3",
                            style: GoogleFonts.lexend(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF101623),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Rating & Review",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA1A8B0),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 2.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(89, 194, 201, 221),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.card_travel, color: Color(0xFF9ED4D6)),
                          SizedBox(width: 6.w),
                          Text(
                            "14",
                            style: GoogleFonts.lexend(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff163453),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Years of work",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA1A8B0),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 2.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(89, 194, 201, 221),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.group_outlined, color: Color(0xFF9ED4D6)),
                          SizedBox(width: 6.w),
                          Text(
                            "125",
                            style: GoogleFonts.lexend(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff163453),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "No. of patients",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA1A8B0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                width: 335.w,
                height: 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.91.r),
                  color: Color.fromARGB(30, 118, 118, 118),
                ),
                child: Row(
                  children: [
                    // Info Tab
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tabBo = 0;
                        });
                      },
                      child: Container(
                        width: 100.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: tabBo == 0 ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(7.r),
                          boxShadow: [
                            if (tabBo == 0)
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 8,
                                spreadRadius: 0,
                                color: Color.fromARGB(30, 0, 0, 0),
                              ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Info",
                            style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ),

                    VerticalDivider(
                      color: Color.fromARGB(91, 60, 60, 67),
                      endIndent: 5,
                      indent: 5,
                    ),

                    // History Tab
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tabBo = 1;
                        });
                      },
                      child: Container(
                        width: 100.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: tabBo == 1 ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(7.r),
                          boxShadow: [
                            if (tabBo == 1)
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 8,
                                spreadRadius: 0,
                                color: Color.fromARGB(30, 0, 0, 0),
                              ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "History",
                            style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ),

                    VerticalDivider(
                      color: Color.fromARGB(91, 60, 60, 67),
                      endIndent: 5,
                      indent: 5,
                    ),

                    // Review Tab
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tabBo = 2;
                        });
                      },
                      child: Container(
                        width: 96.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: tabBo == 2 ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(7.r),
                          boxShadow: [
                            if (tabBo == 2)
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 8,
                                spreadRadius: 0,
                                color: Color.fromARGB(30, 0, 0, 0),
                              ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Review",
                            style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 300.h,
                padding: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFFFFFFFF),
                  border: Border.all(color: Color(0xFFF4F4F4), width: 1.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width,
                      // height: 48.h,
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        top: 14.h,
                        bottom: 14.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                        color: Color(0xffE2F7F8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "In-Clinic Appointment",
                            style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "৳1,000",
                            style: GoogleFonts.inter(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Evercare Hospital Ltd.",
                            style: GoogleFonts.inter(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF000000),
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Boshundhora, Dhaka",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff163453),
                                ),
                              ),
                              Text(
                                "2 More clinic ",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF47BAFF),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF47BAFF),
                                ),
                              ),
                              SizedBox(width: 0.w),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "20 mins or less wait time",
                            style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8C8C8C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Divider(color: Color(0xFFF4F4F4), thickness: 1.w),
                    Expanded(
                      child: DefaultTabController(
                        length: 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.zero,
                              child: TabBar(
                                isScrollable: true,
                                indicatorColor: Color(0xff163453),
                                labelColor: Color(0xFF000000),
                                unselectedLabelColor: Color(0xFF9A97AE),
                                indicatorWeight: 2.w,
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  Tab(
                                    child: Text.rich(
                                      TextSpan(
                                        text: "Time ",
                                        style: GoogleFonts.inter(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF000000),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '(No Slot)',
                                            style: GoogleFonts.inter(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xFF8C8C8C),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text.rich(
                                      TextSpan(
                                        text: "Tomorrow ",
                                        style: GoogleFonts.inter(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF000000),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '(20 Slot)',
                                            style: GoogleFonts.inter(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xFF47BAFF),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text.rich(
                                      TextSpan(
                                        text: "17 Oct ",
                                        style: GoogleFonts.inter(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF000000),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '(20 Slot)',
                                            style: GoogleFonts.inter(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xFF47BAFF),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  ListView.builder(
                                    itemCount: 3,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 10.w,
                                              top: 10.h,
                                            ),
                                            width: 104.w,
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: Color(0xFFE2F7F8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "06:00 - 06:30",
                                                style: GoogleFonts.inter(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff163453),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  ListView.builder(
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            width: 400,
                                            height: 100,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  ListView.builder(
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            width: 400,
                                            height: 100,
                                            color: Colors.black,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Timing",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 70.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10.w),
                      width: 155.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Color(0xFFF4F4F4),
                          width: 1.w,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.w, top: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Monday",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF424242),
                                letterSpacing: -0.3,
                              ),
                            ),
                            Text(
                              "09:00 AM - 05:00 PM",
                              style: GoogleFonts.inter(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF8C8C8C),
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Location",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 70.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10.w),
                      width: 155.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Color(0xFFF4F4F4),
                          width: 1.w,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.w, top: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shahbag",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF424242),
                                letterSpacing: -1,
                              ),
                            ),
                            Text(
                              "BSSMU - Bangaband..",
                              style: GoogleFonts.inter(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF8C8C8C),
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),
              // Center(
              //   child: Text("Map Here ", style: TextStyle(fontSize: 30.sp)),
              // ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300.w, 40.h),
                    backgroundColor: Color(0xff163453),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Book",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
