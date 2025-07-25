import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:therapy_app/Screen/userDetails.page.dart';
import 'package:therapy_app/Screen/userList.page.dart';
import 'package:therapy_app/Screen/doctorProfilePage.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/userListController.dart';

class DoctorHomePage extends ConsumerStatefulWidget {
  const DoctorHomePage({super.key});

  @override
  ConsumerState<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends ConsumerState<DoctorHomePage> {
  int tabBottom = 0;
  List<Map<String, dynamic>> doctorList = [
    {
      "image": "assets/c1.png",
      "name": "Ahmed Khan",
      "specility": "Cardiologist",
      "exp": "2 years",
    },
    {
      "image": "assets/c2.png",
      "name": "Ahmed Khan",
      "specility": "Cardiologist",
      "exp": "4 years",
    },
    {
      "image": "assets/c3.png",
      "name": "Ahmed Khan",
      "specility": "Cardiologist",
      "exp": "3 years",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");

    final userListProvider = ref.watch(userListController);
    if (userListProvider.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(color: buttonColor)),
      );
    }
    if (userListProvider.hasError) {
      return Scaffold(
        body: Center(child: Text(userListProvider.error.toString())),
      );
    }
    return WillPopScope(
      onWillPop: () async {
        if (tabBottom != 0) {
          // First navigate to Home tab
          setState(() {
            tabBottom = 0;
          });
          return false; // Don't exit app
        }
        return true; // App exit
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body:
            tabBottom == 0
                ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
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
                                // "assets/profile.png",
                                "${box.get("profile_picturee") ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.png"}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // "Hi,Alicent Hightower",
                                "Hi, ${box.get("name")}",
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
                      userListProvider.when(
                        data: (userList) {
                          return Padding(
                            padding: EdgeInsets.only(left: 24.w, right: 24.w),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: userList.bookings!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 20.h),
                                      padding: EdgeInsets.only(
                                        left: 12.w,
                                        right: 12.w,
                                        top: 12.h,
                                        bottom: 12.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                        border: Border.all(
                                          color: Color(0xffE4E4E7),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                  builder:
                                                      (
                                                        context,
                                                      ) => UserDetailsPage(
                                                        // id:
                                                        //     userList
                                                        //         .bookings[index]
                                                        //         .user
                                                        //         .id
                                                        //         .toString(),
                                                      ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        10.r,
                                                      ),
                                                  child: Image.network(
                                                    //"assets/doctor1.png",
                                                    // doctorList[index]['image']
                                                    //     .toString(),
                                                    userList
                                                        .bookings![index]
                                                        .user!
                                                        .profilePicture
                                                        .toString(),
                                                    width: 90.w,
                                                    height: 90.h,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (
                                                      context,
                                                      error,
                                                      stackTrace,
                                                    ) {
                                                      return Image.network(
                                                        "https://demofree.sirv.com/nope-not-here.jpg",
                                                        width: 90.w,
                                                        height: 90.h,
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      // "Dr. Ahmed Khan",
                                                      // doctorList[index]['name']
                                                      //     .toString(),
                                                      userList
                                                          .bookings![index]
                                                          .user!
                                                          .name.toString(),
                                                      style: GoogleFonts.inter(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color(
                                                          0xff18181B,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 2.h),
                                                    Text(
                                                      // "Cardiologist",
                                                      // doctorList[index]['specility']
                                                      //     .toString(),
                                                      userList
                                                          .bookings![index]
                                                          .user!
                                                          .specialization.toString(),
                                                      style: GoogleFonts.inter(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: buttonColor,
                                                      ),
                                                    ),
                                                    SizedBox(height: 2.h),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .shopping_bag_outlined,
                                                          color: Color(
                                                            0xff71717A,
                                                          ),
                                                          size: 20.sp,
                                                        ),
                                                        SizedBox(width: 5.h),
                                                        Text(
                                                          "2 years",
                                                          style:
                                                              GoogleFonts.inter(
                                                                fontSize: 15.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                  0xff71717A,
                                                                ),
                                                              ),
                                                        ),
                                                        SizedBox(width: 15.h),
                                                        Icon(
                                                          Icons.star_border,
                                                          color: Color(
                                                            0xff71717A,
                                                          ),
                                                          size: 20.sp,
                                                        ),
                                                        SizedBox(width: 5.h),
                                                        Text(
                                                          "4.8 ",
                                                          style:
                                                              GoogleFonts.inter(
                                                                fontSize: 15.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                  0xff71717A,
                                                                ),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Divider(color: Color(0xffE4E4E7)),
                                          SizedBox(height: 8.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "৳ 500.00",
                                                style: GoogleFonts.inter(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff18181B),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  width: 64.w,
                                                  height: 32.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10.r,
                                                        ),
                                                    color: buttonColor,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "View",
                                                      style: GoogleFonts.inter(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color(
                                                          0xFFFFFFFF,
                                                        ),
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
                                );
                              },
                            ),
                          );
                        },
                        error:
                            (error, stackTrace) =>
                                Center(child: Text(error.toString())),
                        loading:
                            () => Center(
                              child: CircularProgressIndicator(
                                color: buttonColor,
                              ),
                            ),
                      ),
                    ],
                  ),
                )
                : tabBottom == 1
                ? UserListPage()
                : DoctorProfilePage(),
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
                  color:
                      tabBottom == 0 ? Color(0xFFE5EEF8) : Colors.transparent,
                ),
                child: Icon(Icons.home_filled),
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
                  color:
                      tabBottom == 1 ? Color(0xFFE5EEF8) : Colors.transparent,
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
                  color:
                      tabBottom == 2 ? Color(0xFFE5EEF8) : Colors.transparent,
                ),
                child: Icon(Icons.person_2_outlined),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
