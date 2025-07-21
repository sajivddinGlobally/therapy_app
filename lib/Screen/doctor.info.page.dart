import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/data/provider/doctorInfoController.dart';

class DoctorInfoPage extends ConsumerStatefulWidget {
  final String id;
  const DoctorInfoPage({super.key, required this.id});

  @override
  ConsumerState<DoctorInfoPage> createState() => _DoctorInfoPageState();
}

class _DoctorInfoPageState extends ConsumerState<DoctorInfoPage> {
  @override
  Widget build(BuildContext context) {
    final doctorInfo = ref.watch(doctorInfoProvider("1"));
    log(widget.id);
    return Scaffold(
      backgroundColor: Color(0XFF56928A),
      appBar: AppBar(
        backgroundColor: Color(0XFF56928A),
        title: Text(
          "Doctor’s Info",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFFF4F6F9),
          ),
        ),
        centerTitle: true,
      ),
      body: doctorInfo.when(
        data: (snp) {
          if (snp.data!.isEmpty) {
            return Center(
              child: Text(
                "No data available in this category id",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/doctor.png"),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height + 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -4),
                        blurRadius: 24,
                        spreadRadius: 0,
                        color: Color.fromARGB(63, 4, 22, 49),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: ListView.builder(
                      itemCount: snp.data!.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40.h),
                            Row(
                              children: [
                                Text(
                                  //"Dr. Aaron",
                                  snp.data![index].name.toString(),
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2B2B2B),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  // "4.8",
                                  snp.data![index].rating.toString(),
                                  style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2B2B2B),
                                  ),
                                ),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              // "Psychologists | Apollo hospital",
                              snp.data![index].specialization.toString(),
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF868686),
                              ),
                            ),
                            SizedBox(height: 16.sp),
                            Container(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Color(0xFFF4F6F9),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "20",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2B2B2B),
                                        ),
                                      ),
                                      Text(
                                        "Reviews",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF868686),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF57938B),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "70+",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2B2B2B),
                                        ),
                                      ),
                                      Text(
                                        "Patients",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF868686),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF57938B),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "5+",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2B2B2B),
                                        ),
                                      ),
                                      Text(
                                        "Years exp.",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF868686),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Divider(
                              color: Color(0xFFF4F6F9),
                              thickness: 1.w,
                              endIndent: 10,
                              indent: 10,
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              // "About Dr. Aaron",
                              "About Dr. ${snp.data![index].name}",
                              style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2B2B2B),
                                letterSpacing: -1,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text:
                                    "Dr. Aaron, a dedicated Therapist, brings a wealth of experience to Golden Gate Therapy Center in Golden Gate, CA.",
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF868686),
                                  letterSpacing: -1,
                                ),
                                children: [
                                  TextSpan(
                                    text: "view more",
                                    style: GoogleFonts.inter(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff2B2B2B),
                                      letterSpacing: -1,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              "Working time",
                              style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2B2B2B),
                                letterSpacing: -1,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 5.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF868686),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Monday to Friday: 09:00 AM - 05:00PM",
                                  style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF868686),
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 5.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF868686),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Saturday and Sunday: 10:00 AM - 02:00PM",
                                  style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF868686),
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Divider(
                              color: Color(0xFFF4F6F9),
                              thickness: 1.w,
                              endIndent: 10,
                              indent: 10,
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Reviews ",
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2B2B2B),
                                    letterSpacing: -1,
                                  ),
                                ),
                                Text(
                                  "See All",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF15AC86),
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              children: [
                                Container(
                                  width: 57.w,
                                  height: 57.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      fit: BoxFit.cover,
                                      snp.data![index].profilePicture
                                          .toString(),
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Image.network(
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.png",
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Emily Anderson",
                                      style: GoogleFonts.inter(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF374151),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        // Text(
                                        //   "5.0",
                                        //   style: GoogleFonts.inter(
                                        //     fontSize: 12.sp,
                                        //     fontWeight: FontWeight.w600,
                                        //     color: Color(0xFF6B7280),
                                        //   ),
                                        // ),
                                        // SizedBox(width: 4.w),
                                        // Icon(
                                        //   Icons.star,
                                        //   color: Colors.amber,
                                        //   size: 16.sp,
                                        // ),
                                        // Icon(
                                        //   Icons.star,
                                        //   color: Colors.amber,
                                        //   size: 16.sp,
                                        // ),
                                        // Icon(
                                        //   Icons.star,
                                        //   color: Colors.amber,
                                        //   size: 16.sp,
                                        // ),
                                        // Icon(
                                        //   Icons.star,
                                        //   color: Colors.amber,
                                        //   size: 16.sp,
                                        // ),
                                        // Icon(
                                        //   Icons.star,
                                        //   color: Colors.amber,
                                        //   size: 16.sp,
                                        // ),
                                        Text(
                                          snp.data![index].rating ?? "0",
                                          style: GoogleFonts.openSans(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF2B2B2B),
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        RatingBarIndicator(
                                          rating:
                                              double.tryParse(
                                                snp.data![index].rating ?? "0",
                                              ) ??
                                              0.0,
                                          itemCount: 5,
                                          itemSize: 16.sp,
                                          direction: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Icon(
                                              Icons.star,
                                              color: Colors.amberAccent,
                                              size: 15.sp,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              "Dr. Aaron is a true professional who genuinely cares about his patients. I highly recommend to anyone seeking exceptional cardiac care.",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6B7280),
                                letterSpacing: -1,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              children: [
                                Container(
                                  width: 57.w,
                                  height: 57.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Emily Anderson",
                                      style: GoogleFonts.inter(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF374151),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "5.0",
                                          style: GoogleFonts.inter(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF6B7280),
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16.sp,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              "Dr. Aaron is a true professional who genuinely cares about his patients. I highly recommend to anyone seeking exceptional cardiac care.",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6B7280),
                                letterSpacing: -1,
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Container(
          width: 327.w,
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: Color(0xFF15AC86),
          ),
          child: Center(
            child: Text(
              "Book Appointment ",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
