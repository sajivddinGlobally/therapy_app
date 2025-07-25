// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:therapy_app/constant/myColor.dart';

// class UserDetailsScreen extends StatelessWidget {
//   const UserDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         backgroundColor: bgColor,
//         elevation: 0,
//         title: Text(
//           "User Details",
//           style: GoogleFonts.inter(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w600,
//             color: const Color(0xFF2B2B2B),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//         child: SizedBox(
//           width: double.infinity,
//           height: 52.h,
//           child: ElevatedButton(
//             onPressed: () {
//               // Start session logic
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: buttonColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12.r),
//               ),
//             ),
//             child: Text(
//               "Start Session",
//               style: GoogleFonts.inter(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Top Profile Card
//             Container(
//               padding: EdgeInsets.all(16.r),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 6,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12.r),
//                     child: Image.asset(
//                       "assets/boys.png",
//                       width: 80.w,
//                       height: 80.h,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(width: 16.w),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Ravi Sharma",
//                         style: GoogleFonts.inter(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w700,
//                           color: const Color(0xff18181B),
//                         ),
//                       ),
//                       SizedBox(height: 4.h),
//                       Text(
//                         "Male · 28 yrs",
//                         style: GoogleFonts.inter(
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w400,
//                           color: const Color(0xff71717A),
//                         ),
//                       ),
//                       SizedBox(height: 4.h),
//                       Text(
//                         "Session ID: #APT20250726",
//                         style: GoogleFonts.inter(
//                           fontSize: 12.sp,
//                           color: const Color(0xffA1A1AA),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.h),

//             // Session Details
//             _sectionTitle("Session Details"),
//             _infoTile(
//               Icons.calendar_today_outlined,
//               "Appointment",
//               "26 July 2025 · 11:30 AM",
//             ),
//             _infoTile(
//               Icons.assignment_outlined,
//               "Visit Type",
//               "First-time Consultation",
//             ),
//             _infoTile(
//               Icons.error_outline,
//               "Problem",
//               "Sleep disturbance, anxiety",
//             ),

//             SizedBox(height: 20.h),

//             // Contact Info
//             _sectionTitle("Contact Info"),
//             _infoTile(Icons.phone_outlined, "Phone", "+91 98765 43210"),
//             _infoTile(Icons.email_outlined, "Email", "ravi.sharma@email.com"),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _sectionTitle(String title) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.h),
//       child: Text(
//         title,
//         style: GoogleFonts.inter(
//           fontSize: 15.sp,
//           fontWeight: FontWeight.w600,
//           color: const Color(0xff18181B),
//         ),
//       ),
//     );
//   }

//   Widget _infoTile(IconData icon, String label, String value) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.h),
//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: const Color(0xffF4F4F5),
//               shape: BoxShape.circle,
//             ),
//             padding: EdgeInsets.all(10.r),
//             child: Icon(icon, size: 20.sp, color: const Color(0xff71717A)),
//           ),
//           SizedBox(width: 12.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label,
//                   style: GoogleFonts.inter(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w500,
//                     color: const Color(0xff71717A),
//                   ),
//                 ),
//                 SizedBox(height: 2.h),
//                 Text(
//                   value,
//                   style: GoogleFonts.inter(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w600,
//                     color: const Color(0xff18181B),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorUserDetailsScreen extends ConsumerStatefulWidget {
  const DoctorUserDetailsScreen({super.key});

  @override
  ConsumerState<DoctorUserDetailsScreen> createState() =>
      _DoctorUserDetailsScreenState();
}

class _DoctorUserDetailsScreenState
    extends ConsumerState<DoctorUserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: Text(
          'Patient Details',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            buildHeaderSection(),

            buildSectionCard("Appointment", [
              buildRow("Date & Time", "26 July 2025 · 11:30 AM"),
              buildRow("Type", "First-time Consultation"),
              buildRow("Duration", "45 minutes"),
              buildRow("Status", "Confirmed"),
            ]),

            buildSectionCard("Case Information", [
              buildRow("Primary Issue", "Anxiety, Overthinking"),
              buildRow("Description", "Trouble sleeping for last 2 weeks"),
              buildRow("First Visit", "10 July 2025"),
            ]),

            buildSectionCard("Therapist", [
              buildRow("Name", "Dr. Seema Verma"),
              buildRow("Speciality", "Clinical Psychologist"),
              buildRow("Rating", "⭐ 4.8"),
            ]),

            buildSectionCard("Contact", [
              buildRow("Phone", "+91 98765 43210"),
              buildRow("Email", "ravi.sharma@email.com"),
              buildRow("Address", "Bangalore, India"),
            ]),

            buildSectionCard("Session History", [
              buildRow("Last Session", "12 July 2025"),
              buildRow("Last Notes", "Advised sleep journaling"),
              buildRow("Feedback", "Improving, follow-up after 1 week"),
            ]),

            buildSectionCard("Documents", [
              buildRow("Prescription", "Download PDF"),
              buildRow("Reports", "Sleep reports"),
              buildRow("Photos", "Mood tracker"),
            ]),

            SizedBox(height: 30.h),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildActionButton(Icons.play_arrow, "Start", Colors.green),

            // buildActionButton(Icons.note_add, "Notes", Colors.orange),
            // buildActionButton(Icons.call, "Call", Colors.blue),
            // buildActionButton(Icons.schedule, "Reschedule", Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: AssetImage('assets/boys.png'),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ravi Sharma',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'APT20250726 · Male · 28 yrs',
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSectionCard(String title, List<Widget> rows) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          ...rows,
        ],
      ),
    );
  }

  Widget buildRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActionButton(IconData icon, String label, Color color) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {},
        // icon: Icon(icon, size: 16.sp),
        label: Text(label, style: GoogleFonts.poppins(fontSize: 16.sp)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
