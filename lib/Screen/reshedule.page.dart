import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:therapy_app/constant/myColor.dart';

class ReshedulePage extends StatefulWidget {
  const ReshedulePage({super.key});

  @override
  State<ReshedulePage> createState() => _ReshedulePageState();
}

class _ReshedulePageState extends State<ReshedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Book Appointment",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h),
          AppoinmentBody(txt: "Select Date for 1st Session"),
          SizedBox(height: 10.h),
          AppoinmentBody(txt: "Select Date for 2nd Session"),
          SizedBox(height: 10.h),
          AppoinmentBody(txt: 'Select Date for 3rd Session'),
        ],
      ),
    );
  }
}

class AppoinmentBody extends StatefulWidget {
  final String txt;
  const AppoinmentBody({super.key, required this.txt});

  @override
  State<AppoinmentBody> createState() => _AppoinmentBodyState();
}

class _AppoinmentBodyState extends State<AppoinmentBody> {
  DateTime? selectData;
  Future<void> pickDate() async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (datePicked != null) {
      setState(() {
        selectData = datePicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickDate();
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 24.h,
          bottom: 24.h,
        ),
        decoration: BoxDecoration(color: Color(0xFFF4F6F9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectData == null
                  ? widget.txt
                  : DateFormat('dd/MM/yyyy').format(selectData!),
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF2B2B2B),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF2B2B2B),
              size: 25.sp,
            ),
          ],
        ),
      ),
    );
  }
}
