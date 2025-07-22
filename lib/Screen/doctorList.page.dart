import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/doctorDetails.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  List<Map<String, dynamic>> doctorList = [
    {
      "image": "assets/a1.jpg",
      "name": "Ahmed Khan",
      "specility": "Cardiologist",
      "exp": "2 years",
    },
    {
      "image": "assets/boys.png",
      "name": "Ahmed Khan",
      "specility": "Cardiologist",
      "exp": "4 years",
    },
    {
      "image": "assets/swiper.png",
      "name": "Ahmed Khan",
      "specility": "Cardiologist",
      "exp": "3 years",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: Text(
          "Upcoming",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 14.h,
                  bottom: 14.h,
                  right: 10.w,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: Color(0xffD9D9D9),
                    width: 0.93.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: Color(0xffD9D9D9),
                    width: 0.93.w,
                  ),
                ),
                prefixIcon: Icon(Icons.search, color: Color(0xffD9D9D9)),
                hintText: "Search...",
                hintStyle: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xffBDBDBD),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: doctorList.length,
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
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: Color(0xffE4E4E7)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => DoctorDetailsPage(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      //"assets/doctor1.png",
                                      doctorList[index]['image'].toString(),
                                      width: 72.w,
                                      height: 72.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "Dr. Ahmed Khan",
                                        doctorList[index]['name'].toString(),
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff18181B),
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        // "Cardiologist",
                                        doctorList[index]['specility']
                                            .toString(),
                                        style: GoogleFonts.inter(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: buttonColor,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.shopping_bag_outlined,
                                            color: Color(0xff71717A),
                                            size: 20.sp,
                                          ),
                                          SizedBox(width: 5.h),
                                          Text(
                                            "2 years",
                                            style: GoogleFonts.inter(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff71717A),
                                            ),
                                          ),
                                          SizedBox(width: 15.h),
                                          Icon(
                                            Icons.star_border,
                                            color: Color(0xff71717A),
                                            size: 20.sp,
                                          ),
                                          SizedBox(width: 5.h),
                                          Text(
                                            "4.8 ",
                                            style: GoogleFonts.inter(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff71717A),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "৳ 500.00",
                                  style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff18181B),
                                  ),
                                ),
                                // Container(
                                //   width: 64.w,
                                //   height: 32.h,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10.r),
                                //     color: buttonColor,
                                //   ),
                                //   child: Center(
                                //     child: Text(
                                //       "Book",
                                //       style: GoogleFonts.inter(
                                //         fontSize: 12.sp,
                                //         fontWeight: FontWeight.w500,
                                //         color: Color(0xFFFFFFFF),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
