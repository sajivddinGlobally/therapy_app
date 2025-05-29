import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:therapy_app/Screen/question3.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class Question2Page extends StatefulWidget {
  final int currentStep;
  const Question2Page({super.key, required this.currentStep});

  @override
  State<Question2Page> createState() => _Question2PageState();
}

class _Question2PageState extends State<Question2Page> {
  List<String> therapies = [
    'Anxiety',
    'Depression',
    'Stress Management',
    'Relationship Issues',
    'PTSD',
    'Addiction',
    'Eating Disorders',
  ];

  Set<String> selectedTherapies = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              StepProgressIndicator(
                totalSteps: 3,
                currentStep: widget.currentStep,
                size: 8.sp,
                padding: 0,
                selectedColor: Color(0xFF59EAC6),
                unselectedColor: Color(0xFFE8E9F1),
                roundedEdges: Radius.circular(4.r),
              ),
              SizedBox(height: 40.h),
              Text(
                "What type of therapy are you interested in?",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2024),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 10.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: therapies.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedTherapies.contains(
                    therapies[index],
                  );
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected
                            ? selectedTherapies.remove(therapies[index])
                            : selectedTherapies.add(therapies[index]);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 22.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color:
                              isSelected
                                  ? Color(0xFF15AC86)
                                  : Color(0xFFF4F6F9),
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: isSelected ? Color(0xFF15AC86) : Colors.grey,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              therapies[index],
                              style: GoogleFonts.nunito(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2B2B2B),
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Question3Page(currentStep: 2),
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
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
