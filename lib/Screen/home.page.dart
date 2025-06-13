import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:therapy_app/Screen/account.page.dart';
import 'package:therapy_app/Screen/appoinment.page.dart';
import 'package:therapy_app/Screen/chat.inbox.page.dart';
import 'package:therapy_app/Screen/plan.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> categoryList = [
    {"imageUrl": "assets/individual.png", "txt": "Individual Therapy"},
    {"imageUrl": "assets/counsling.png", "txt": "Couples Counseling"},
    {"imageUrl": "assets/parents.png", "txt": "First Time Parents"},
    {"imageUrl": "assets/stress.png", "txt": "Stress"},
    {"imageUrl": "assets/deepression.png", "txt": "Depression"},
  ];
  int tabBottom = 0;
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    return Scaffold(
      backgroundColor: bgColor,
      body:
          tabBottom == 0
              ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        SizedBox(width: 24.w),
                        Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              //"assets/profile.png",
                              "${box.get("profile_picture") ?? "https://placehold.jp/3d4070/ffffff/150x150.png"}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, ${box.get("name") ?? "Alicent Hightower"} ",
                              style: GoogleFonts.nunito(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2B2B2B),
                                letterSpacing: -1,
                                height: 1.0,
                              ),
                            ),
                            Text(
                              "How are you feeling! ",
                              style: GoogleFonts.nunito(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF868686),
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 52.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF4F6F9),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.notifications_none,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 24.w),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF4F6F9),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF2B2B2B),
                            size: 25.sp,
                          ),
                          hintText: "Search...",
                          hintStyle: GoogleFonts.nunito(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF868686),
                          ),
                          suffixIcon: Icon(
                            Icons.tune_outlined,
                            color: Color(0xFF868686),
                            size: 25.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24.w,
                        right: 24.w,
                        top: 22.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Upcoming Appointment",
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2B2B2B),
                                ),
                              ),
                              Text(
                                "See All",
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF15AC86),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Color(0xFF15AC86),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 56.w,
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      child: Image.asset(
                                        "assets/dot.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Dr. Aaron ",
                                          style: GoogleFonts.nunito(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "10:00 AM",
                                              style: GoogleFonts.nunito(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                letterSpacing: -1,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Container(
                                              width: 5.w,
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "Physiotherapist ",
                                              style: GoogleFonts.nunito(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                letterSpacing: -1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 14.w,
                                        right: 14.w,
                                        top: 5.h,
                                        bottom: 5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          50.r,
                                        ),
                                        color: Color(0xFF44bd9E),
                                      ),
                                      child: Text(
                                        "Starts in 10 mins",
                                        style: GoogleFonts.nunito(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 14.w,
                                        right: 14.w,
                                        top: 5.h,
                                        bottom: 5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        color: Color(0xFFFFFFFF),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.video_camera_back_outlined,
                                            color: Color(0xFF44bd9E),
                                            size: 20.sp,
                                          ),
                                          SizedBox(width: 5.w),
                                          Text(
                                            "Join Session",
                                            style: GoogleFonts.nunito(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF44bd9E),
                                              letterSpacing: -1,
                                            ),
                                          ),
                                        ],
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
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24.w,
                        right: 24.w,
                        top: 30.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories ",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2B2B2B),
                            ),
                          ),
                          Text(
                            "See All",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF15AC86),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 24.w,
                            right: 24.h,
                            top: 12.h,
                          ),
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => PlanPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 327.w,
                                  height: 110.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    color: Colors.blueGrey,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.asset(
                                      categoryList[index]["imageUrl"]
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20.w,
                                bottom: 14.h,
                                child: Text(
                                  categoryList[index]["txt"].toString(),
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              )
              : tabBottom == 1
              ? ChatInboxPage()
              : tabBottom == 2
              ? AppoinmentPage()
              : AccountPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        onTap: (value) {
          setState(() {
            tabBottom = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: buttonColor,
        currentIndex: tabBottom,
        unselectedItemColor: Color(0xFF2B2B2B),
        iconSize: 24.sp,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFE5EEF8),
            icon: Container(
              padding: EdgeInsets.zero,
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: tabBottom == 0 ? Color(0xFFE5EEF8) : Colors.transparent,
              ),
              child: Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.zero,
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: tabBottom == 1 ? Color(0xFFE5EEF8) : Colors.transparent,
              ),
              child: Icon(Icons.messenger_outline),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.zero,
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: tabBottom == 2 ? Color(0xFFE5EEF8) : Colors.transparent,
              ),
              child: Icon(Icons.calendar_month_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.zero,
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: tabBottom == 3 ? Color(0xFFE5EEF8) : Colors.transparent,
              ),
              child: Icon(Icons.person_2_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
