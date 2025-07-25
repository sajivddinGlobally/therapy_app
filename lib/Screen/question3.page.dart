import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:therapy_app/Screen/login.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/registerController.dart';

class Question3Page extends ConsumerStatefulWidget {
  final int currentStep;
  const Question3Page({super.key, required this.currentStep});

  @override
  ConsumerState<Question3Page> createState() => _Question3PageState();
}

class _Question3PageState extends ConsumerState<Question3Page> {
  void showDiologBox() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          child: Container(
            width: 327.w,
            height: 242.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Color(0xFFFEFEFE),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 18.w,
                right: 18.w,
                top: 28.h,
                // bottom: 28.h,
              ),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "I agree to the Terms of Service and Conditions of Use including consent to electronic communications and I affirm that the information provided is my own.",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (context) => LoginPage()),
                        (route) => false,
                      );
                    },
                    child: Container(
                      width: 291.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.95.r),
                        color: buttonColor,
                      ),
                      child: Center(
                        child: Text(
                          "Agree and continue",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Disagree",
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool isLoading = false;

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
                currentStep: widget.currentStep,
                size: 8.sp,
                padding: 0,
                selectedColor: Color(0xFF59EAC6),
                unselectedColor: Color(0xFFE8E9F1),
                roundedEdges: Radius.circular(4.r),
              ),
              SizedBox(height: 30.h),
              QuestBody(
                txt:
                    "What are your primary goals for therapy? (e.g., reducing anxiety, improving relationships)",
              ),
              SizedBox(height: 16.h),
              QuestBody(
                txt: "How do you envision your life improving through therapy?",
              ),
              SizedBox(height: 16.h),
              QuestBody(
                txt:
                    "Is there anything else you’d like us to know before starting therapy?",
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () async {
                  try {
                    setState(() {
                      isLoading = true;
                    });
                    ref.read(registerFormProvider.notifier).setCategoryId(1);
                    // ref
                    //     .read(registerFormProvider.notifier)
                    //     .setUserType("therapist");
                    await ref
                        .read(registerFormProvider.notifier)
                        .registerUser();
                    Fluttertoast.showToast(
                      msg: "Registered successfully!",
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: buttonColor,
                      textColor: Color(0xFFFFFFFF),
                    );
                    setState(() {
                      isLoading = false;
                    });
                    showDiologBox();
                    setState(() {
                      widget.currentStep + 1;
                    });
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    Fluttertoast.showToast(
                      msg: "Something went wrong",
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: buttonColor,
                      textColor: Color(0xFFFFFFFF),
                    );
                    log(e.toString());
                  }
                },
                child: Container(
                  width: 327.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Center(
                    child:
                        isLoading
                            ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                            : Text(
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
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestBody extends StatelessWidget {
  final String txt;
  const QuestBody({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2024),
            letterSpacing: -1,
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 10.w,
              top: 10.w,
              right: 10.w,
              bottom: 10.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.w),
            ),
            hintText: "Write your Problem",
            hintStyle: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFFC8C8C8),
            ),
          ),
        ),
      ],
    );
  }
}
