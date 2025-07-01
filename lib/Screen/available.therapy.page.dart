import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/doctor.info.page.dart';
import 'package:therapy_app/Screen/payment.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/categoryController.dart';
import 'package:therapy_app/data/provider/mentailHealtheavailableController.dart';

class AvailableTherapyPage extends ConsumerStatefulWidget {
  const AvailableTherapyPage({super.key});

  @override
  ConsumerState<AvailableTherapyPage> createState() =>
      _AvailableTherapyPageState();
}

class _AvailableTherapyPageState extends ConsumerState<AvailableTherapyPage> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(categoryProviderNotifier);
    final findavailabletheray = ref.watch(
      availableTherapyController(name.toString()),
    );
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
      body: findavailabletheray.when(
        data: (availabletherapy) {
          if (availabletherapy.users!.isEmpty) {
            return Center(
              child: Text(
                "No therapist found in this category",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2B2B2B),
                  letterSpacing: 0.3,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: availabletherapy.users!.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => DoctorInfoPage(),
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 70.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.blueGrey,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      10.r,
                                    ),
                                    child: Image.network(
                                      // "assets/dot.png",
                                      availabletherapy
                                          .users![index]
                                          .profilePicture
                                          .toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Image.network(
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.png", // fallback if image fails
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // "Dr. Aaron ",
                                      availabletherapy.users![index].name
                                          .toString(),
                                      style: GoogleFonts.inter(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF2B2B2B),
                                        letterSpacing: -1,
                                      ),
                                    ),
                                    Text(
                                      // "Certified Therapist ",
                                      availabletherapy
                                              .users![index]
                                              .specialization ??
                                          "null",
                                      style: GoogleFonts.inter(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF868686),
                                        letterSpacing: -1,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          availabletherapy
                                                  .users![index]
                                                  .rating ??
                                              "0",
                                          style: GoogleFonts.openSans(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF2B2B2B),
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        RatingBarIndicator(
                                          rating:
                                              // double.tryParse(
                                              //   availabletherapy
                                              //       .users[index]
                                              //       .rating,
                                              // ) ??
                                              // 0.0,
                                              double.tryParse(
                                                availabletherapy
                                                        .users![index]
                                                        .rating ??
                                                    "0",
                                              ) ??
                                              0.0,
                                          itemCount: 5,
                                          itemSize: 16.sp,
                                          direction: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Icon(
                                              Icons.star,
                                              color: buttonColor,
                                              size: 15.sp,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => DoctorInfoPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "View Profile ",
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: buttonColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
              );
            },
          );
        },
        error: (error, stackTrace) {
          if (error is DioException && error.response?.statusCode == 401) {
            log(error.toString());
            return SizedBox.shrink();
          } else {
            return Center(
              child: Text("Something Went Wrong ${error.toString()}"),
            );
          }
        },
        loading:
            () =>
            //Center(child: Image.asset("assets/find.png")),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/find.png"),
                  SizedBox(height: 20),
                  Text(
                    "Loading therapists...",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
