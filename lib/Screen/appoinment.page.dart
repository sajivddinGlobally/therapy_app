import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/chat.inbox.page.dart';
import 'package:therapy_app/Screen/reshedule.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/bookingsController.dart';

class AppoinmentPage extends ConsumerStatefulWidget {
  const AppoinmentPage({super.key});

  @override
  ConsumerState<AppoinmentPage> createState() => _AppoinmentPageState();
}

class _AppoinmentPageState extends ConsumerState<AppoinmentPage> {
  int defaultab = 0;
  @override
  Widget build(BuildContext context) {
    final bookingsProvider = ref.watch(bookingsControlelr);
    final userBookingProvider = ref.watch(userBookingController);
    return Scaffold(
      backgroundColor: Color(0xFFF4F6F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: Text(
          "My Appointments",
          style: GoogleFonts.nunito(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2B2B2B),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: DefaultTabController(
          initialIndex: defaultab,
          length: 2,
          child: Column(
            children: [
              TabBar(
                dividerColor: Color(0xFF868686),
                indicatorColor: buttonColor,
                indicatorWeight: 4.w,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Color(0xFF4F4F4F),
                labelStyle: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: buttonColor,
                  letterSpacing: -1,
                ),
                onTap: (value) {
                  setState(() {
                    defaultab = value;
                  });
                },
                tabs: [
                  Tab(
                    child: Text(
                      "Upcoming",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Past",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              // Add Expanded here to avoid unbounded height error
              Expanded(
                child: TabBarView(
                  children: [
                    // Upcoming Tab
                    userBookingProvider.when(
                      data: (data) {
                        final upcomingAppointments =
                            data
                                .where(
                                  (upcoming) => upcoming.status != "completed",
                                )
                                .toList();
                        if (upcomingAppointments.isEmpty) {
                          return Center(
                            child: Text("No upcoming appointments."),
                          );
                        }
                        return ListView.builder(
                          // padding: EdgeInsets.zero,
                          itemCount: upcomingAppointments.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 14.h),
                              child: PastBody(
                                name: upcomingAppointments[index].therapistName,
                                time: "Today, ${upcomingAppointments[index].time}",
                                status: upcomingAppointments[index].status,
                                button1: "Reschedule",
                                button2: "Join Chat",
                                callback: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => ChatInboxPage(),
                                    ),
                                  );
                                },
                                statusColor: Color(0xFF00BAF7),
                                voidCallback: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => ReshedulePage(),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) {
                        if (error is DioException &&
                            error.response!.statusCode == 401) {
                          log(error.toString());
                          return SizedBox.shrink();
                        } else {
                          return Center(
                            child: Text(
                              "Something went wrong ${error.toString()}",
                            ),
                          );
                        }
                      },
                      loading:
                          () => SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: buttonColor,
                              ),
                            ),
                          ),
                    ),
                    // Past Tab
                    userBookingProvider.when(
                      data: (data) {
                        final pastAppointments =
                            data
                                .where((past) => past.status == "completed")
                                .toList();

                        if (pastAppointments.isEmpty) {
                          return Center(child: Text("No past appointments."));
                        }
                        return Padding(
                          padding: EdgeInsets.only(bottom: 14.h),
                          child: ListView.builder(
                            itemCount: pastAppointments.length,
                            itemBuilder: (context, index) {
                              return PastBody(
                                name: pastAppointments[index].therapistName,
                                time: "Today, ${pastAppointments[index].time}",
                                status: pastAppointments[index].status,
                                button1: "Book Again",
                                button2: "Leave a review",
                                statusColor: Color(0xFF00BAF7),
                                voidCallback: () {},
                                callback: () {},
                              );
                            },
                          ),
                        );
                      },
                      error:
                          (error, stackTrace) =>
                              Center(child: Text(error.toString())),
                      loading:
                          () => Center(
                            child: CircularProgressIndicator(
                              color: buttonColor,
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PastBody extends StatelessWidget {
  final String name;
  final String time;
  final String status;
  final String button1;
  final String button2;
  final Color statusColor;
  final Function voidCallback;
  final Function callback;
  const PastBody({
    super.key,
    required this.status,
    required this.button1,
    required this.button2,
    required this.statusColor,
    required this.voidCallback,
    required this.callback,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 14.w,
        right: 14.w,
        top: 14.h,
        bottom: 14.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.blueGrey,
                ),
                child: Image.asset("assets/dot.png", fit: BoxFit.cover),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // "Dr. Aaron",
                    name,
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2B2B2B),
                      letterSpacing: -1,
                    ),
                  ),
                  Text(
                    time,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF868686),
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 2.h,
                      bottom: 2.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: Color(0xFFE6F7FE),
                    ),
                    child: Text(
                      status,
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: statusColor,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: 42.w,
                height: 42.h,
                decoration: BoxDecoration(
                  color: Color(0xFFE5EEF8),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xFF15AC86),
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(
            color: Colors.grey,
            thickness: 1.w,
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  voidCallback();
                },
                child: Container(
                  width: 144.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xFFFFFFFF),
                    border: Border.all(color: Color(0xFF15AC86), width: 1.w),
                  ),
                  child: Center(
                    child: Text(
                      button1,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF15AC86),
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () {
                  callback();
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
                      button2,
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
    );
  }
}
