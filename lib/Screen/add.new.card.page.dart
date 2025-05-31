import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/constant/myColor.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  final nameController = TextEditingController();
  final cardNumController = TextEditingController();
  final expireController = TextEditingController();
  final cvcController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Add New Card",
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
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            AddCardBody(
              hintxt: "Card Holder Name",
              controller: nameController,
              type: TextInputType.text,
            ),
            SizedBox(height: 16.h),
            AddCardBody(
              hintxt: "Card Number",
              controller: cardNumController,
              type: TextInputType.number,
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                Expanded(
                  child: AddCardBody(
                    hintxt: "Expire Date ",
                    controller: expireController,
                    type: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: AddCardBody(
                    hintxt: "CVC",
                    controller: cvcController,
                    type: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 2),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 327.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFF15AC86),
                ),
                child: Center(
                  child: Text(
                    "Add Card",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFFFF),
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

class AddCardBody extends StatelessWidget {
  final String hintxt;
  final TextEditingController controller;
  final TextInputType type;
  const AddCardBody({
    super.key,
    required this.hintxt,
    required this.controller,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20.w, right: 10.w),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.w),
        ),
        hintText: hintxt,
        hintStyle: GoogleFonts.inter(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFFC8C8C8),
          letterSpacing: -1,
        ),
      ),
    );
  }
}
