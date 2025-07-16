import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/appoinment.page.dart';
import 'package:therapy_app/Screen/book.reshedule.page.dart';
import 'package:therapy_app/Screen/home.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/resheduleController.dart';

class ResheduleDatePage extends ConsumerStatefulWidget {
  const ResheduleDatePage({super.key});

  @override
  ConsumerState<ResheduleDatePage> createState() => _ResheduleDatePageState();
}

class _ResheduleDatePageState extends ConsumerState<ResheduleDatePage> {
  void showDiologBox() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          child: Container(
            width: 327.w,
            height: 400.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
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
                  Container(
                    width: 131.w,
                    height: 131.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(76, 164, 207, 195),
                    ),
                    child: Center(
                      child: Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF15AC86),
                        ),
                        child: Center(
                          child: Container(
                            width: 50.67.w,
                            height: 60.31.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.done,
                                color: Color(0xFF292D32),
                                size: 40.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Center(
                    child: Text(
                      "Appointment Reschedule ",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C2A3A),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Your appointment with Dr. David Patel is reschedule for June 30, 2023, at 10:00 AM.",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4F4F4F),
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => AppoinmentPage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                      width: 291.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.95.r),
                        color: Color(0xFF15AC86),
                      ),
                      child: Center(
                        child: Text(
                          "View Appointment ",
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (context) => HomePage()),
                        (route) => false,
                      );
                    },
                    child: Center(
                      child: Text(
                        "Back to Home",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF15AC86),
                        ),
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

  // Local state for UI selection
  DateTime? selectedDate;
  String? selectedTimeSlot;
  final List<String> timeSlots = [
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "01:00 PM",
  ];
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
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14.h),
            Text(
              "Select Date",
              style: GoogleFonts.nunito(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2B2B2B),
                letterSpacing: -1,
              ),
            ),
            SizedBox(height: 6.h),
            // AppoinmentBody(txt: "Select Date"),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 30)),
                );
                if (date != null) {
                  selectedDate = date;
                  notifier.setDate(date.toIso8601String());
                  setState(() {});
                }
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: Color(0xFFF4F6F9),
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  selectedDate != null
                      ? "${selectedDate!.toLocal()}".split(' ')[0]
                      : "Tap to select date",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),
            Text(
              "Message ",
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2B2B2B),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 6.h),
            //   height: 50.h,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     padding: EdgeInsets.zero,
            //     itemCount: 5,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: EdgeInsets.only(right: 13.w),
            //         child: Column(
            //           children: [
            //             Container(
            //               padding: EdgeInsets.only(
            //                 left: 16.w,
            //                 right: 16.w,
            //                 bottom: 10.h,
            //                 top: 10.h,
            //               ),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(14.r),
            //                 color: Color(0xFFF4F6F9),
            //               ),
            //               child: Text(
            //                 "09:00 AM",
            //                 style: GoogleFonts.inter(
            //                   fontSize: 12.sp,
            //                   fontWeight: FontWeight.w600,
            //                   color: Color(0xFF2B2B2B),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              height: 50.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  final slot = timeSlots[index];
                  final isSelected = selectedTimeSlot == slot;
                  return Padding(
                    padding: EdgeInsets.only(right: 13.w),
                    child: GestureDetector(
                      onTap: () {
                        selectedTimeSlot = slot;
                        notifier.setTimeSlot(slot);
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: isSelected ? buttonColor : Color(0xFFF4F6F9),
                        ),
                        child: Text(
                          slot,
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color:
                                isSelected ? Colors.white : Color(0xFF2B2B2B),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                if (selectedDate == null || selectedTimeSlot == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please select both date and time slot"),
                    ),
                  );
                  return;
                }

                // 🔥 Call API (assume bookingId = 5 here)
                await notifier.submitReschedule(5);

                final apiState = ref.read(rescheduleFlowProvider);
                apiState.when(
                  data: (data) {
                    if (data.response != null) {
                      showDiologBox();
                    }
                  },
                  error: (e, st) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Error: $e")));
                  },
                  loading: () {
                    return CircularProgressIndicator(color: Colors.white);
                  },
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
            // Spacer(),
            // SizedBox(height: MediaQuery.of(context).size.height / 2),
            // GestureDetector(
            //   onTap: () async {
            //     //showDiologBox();
            //     if (selectedDate == null || selectedTimeSlot == null) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text("Please select both date and time slot"),
            //         ),
            //       );
            //       return;
            //     }

            //     // 🔥 Call API (assume bookingId = 5 here)
            //     await notifier.submitReschedule(5);

            //     final apiState = ref.read(rescheduleFlowProvider);
            //     apiState.when(
            //       data: (data) {
            //         if (data.response != null) {
            //           showDiologBox();
            //         }
            //       },
            //       error: (e, st) {
            //         ScaffoldMessenger.of(
            //           context,
            //         ).showSnackBar(SnackBar(content: Text("Error: $e")));
            //       },
            //       loading: () {},
            //     );
            //   },
            //   child: Container(
            //     width: 327.w,
            //     height: 56.h,
            //     decoration: BoxDecoration(
            //       color: buttonColor,
            //       borderRadius: BorderRadius.circular(14.r),
            //     ),
            //     child: Center(
            //       child: Text(
            //         "Continue",
            //         style: GoogleFonts.inter(
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
