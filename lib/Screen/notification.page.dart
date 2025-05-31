import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/constant/myColor.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Notification",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
            letterSpacing: -1,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Row(
            children: [
              SizedBox(width: 24.w),
              Text(
                "Today",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B7280),
                ),
              ),
              Spacer(),
              Text(
                "Mark all as read",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1C2A3A),
                ),
              ),
              SizedBox(width: 24.w),
            ],
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 18.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotifiBody(
                  bgColor: Color(0xFFDEF7E5),
                  title: "Appointment Success",
                  subtitle:
                      "You have successfully booked your\nappointment with Dr. Emily Walker.",
                  hour: "1h",
                ),
                SizedBox(height: 25.h),
                NotifiBody(
                  bgColor: Color(0xFFFDE8E8),
                  title: "Appointment Cancelled",
                  subtitle:
                      "You have successfully cancelled your\nappointment with Dr. Emily Walker.",
                  hour: "2h",
                ),
                SizedBox(height: 25.h),
                NotifiBody(
                  bgColor: Color(0xFFF3F4F6),
                  title: "Scheduled Changed",
                  subtitle:
                      "You have successfully changes your\nappointment with Dr. Emily Walker.",
                  hour: "8h",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotifiBody extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String subtitle;
  final String hour;
  const NotifiBody({
    super.key,
    required this.bgColor,
    required this.title,
    required this.subtitle,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: Icon(Icons.date_range_outlined, color: Color(0xFF014737)),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C2A3A),
                letterSpacing: -1,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B7280),
                letterSpacing: -1,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          hour,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6B7280),
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }
}
