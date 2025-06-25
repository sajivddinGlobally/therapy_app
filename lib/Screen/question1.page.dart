import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:therapy_app/Screen/question2.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/registerController.dart';

class Question1Page extends ConsumerStatefulWidget {
  const Question1Page({super.key});

  @override
  ConsumerState<Question1Page> createState() => _Question1PageState();
}

class _Question1PageState extends ConsumerState<Question1Page> {
  List<String> seekingtherapylist = [
    'Cognitive Behavioral Therapy (CBT)',
    'Dialectical Behavior Therapy (DBT)',
    'Psychodynamic Therapy',
    'Family Therapy',
    'Child & Adolescent Therapy',
    'Grief Counseling',
    'Trauma-Informed Therapy',
  ];

  Set<String> seekingTherapies = {};
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final register = ref.watch(registerFormProvider);
    final data = ref.read(registerFormProvider.notifier);
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
                currentStep: currentStep,
                size: 8.sp,
                padding: 0,
                selectedColor: Color(0xFF59EAC6),
                unselectedColor: Color(0xFFE8E9F1),
                roundedEdges: Radius.circular(4.r),
              ),
              SizedBox(height: 40.h),
              Text(
                "What are the main reasons you're seeking therapy?",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2024),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 30.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: seekingtherapylist.length,
                itemBuilder: (context, index) {
                  final isSelected = seekingTherapies.contains(
                    seekingtherapylist[index],
                  );
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected
                            ? seekingTherapies.remove(seekingtherapylist[index])
                            : seekingTherapies.add(seekingtherapylist[index]);
                      });

                      /// ✅ Save in provider on each tap
                      data.setSpecialization(seekingTherapies.join(', '));
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
                              seekingtherapylist[index],
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
                onTap: () async {
                  data.setSpecialization(seekingTherapies.join(', '));

                  if (currentStep < 3) {
                    setState(() {
                      currentStep++;
                    });
                  }
                  log(seekingTherapies.toString());
                  Fluttertoast.showToast(
                    msg: "step next",
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: buttonColor,
                    textColor: Color(0xFFFFFFFF),
                  );

                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Question2Page(currentStep: 1),
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
