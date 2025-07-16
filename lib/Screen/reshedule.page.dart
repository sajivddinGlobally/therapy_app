import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/reshedule.date.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/resheduleController.dart';

class ReshedulePage extends ConsumerStatefulWidget {
  const ReshedulePage({super.key});

  @override
  ConsumerState<ReshedulePage> createState() => _ReshedulePageState();
}

class _ReshedulePageState extends ConsumerState<ReshedulePage> {
  String? selectedGender;
  final List<String> genders = ['Other'];
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(rescheduleFlowProvider);
    final notifier = ref.read(rescheduleFlowProvider.notifier);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Reschedule",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Text(
                "Reason for Schedule Changes ",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2B2B2B),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                "Select Reason",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B2B2B),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 10.h),
              DropdownButtonFormField<String>(
                icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF868686)),
                padding: EdgeInsets.zero,
                value: selectedGender,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF4F6F9),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                    bottom: 20.h,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                hint: Text(
                  "Select",
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFC8C8C8),
                  ),
                ),
                items:
                    genders.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                // onChanged: (value) {
                //   setState(() {
                //     selectedGender = value;
                //   });
                // },
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                  notifier.setReason(value!);
                },
              ),
              SizedBox(height: 14.h),
              Text(
                "Message ",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B2B2B),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 6.h),
              TextField(
                maxLines: 7,
                controller: messageController,
                onChanged: (value) {
                  notifier.setMessage(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF4F6F9),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    bottom: 10.h,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Message",
                  hintStyle: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFC8C8C8),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3.6),
              GestureDetector(
                onTap: () async {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => ResheduleDatePage(),
                  //   ),
                  // );
                  if (selectedGender == null ||
                      messageController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all fields")),
                    );
                    return;
                  }
                  notifier.setReason(selectedGender!);
                  notifier.setMessage(messageController.text.trim());
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ResheduleDatePage(),
                    ),
                  );
                },
                child: Container(
                  width: 327.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
