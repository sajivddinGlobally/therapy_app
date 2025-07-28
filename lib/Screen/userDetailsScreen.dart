import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:therapy_app/data/provider/userDetailsController.dart';

class UserDetailsScreen extends ConsumerStatefulWidget {
  final String id;
  const UserDetailsScreen({super.key, required this.id});

  @override
  ConsumerState<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends ConsumerState<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");

    final userDetailsProvider = ref.watch(userDetailsController(widget.id));
    
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
      body: userDetailsProvider.when(
        data: (data) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              children: [
                buildHeaderSection(
                  data.profilePicture ??
                      "https://demofree.sirv.com/nope-not-here.jpg",
                  data.name,
                  // data.gender ?? box.get("gender"),
                  data.gender?.toString() ?? "N/A",
                ),

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
                  buildRow("Name", "${box.get("name")}"),
                  buildRow("Speciality", "${data.specialization}"),
                  buildRow("Rating", data.rating ?? "⭐ 4.8"),
                ]),

                buildSectionCard("Contact", [
                  // buildRow("Phone", "+91 98765 43210"),
                  // buildRow("Email", "ravi.sharma@email.com"),
                  buildRow(
                    "Phone",
                    data.phoneNumber?.toString() ?? "Not Provided",
                  ),
                  buildRow(
                    "Email",
                    data.email.isNotEmpty ? data.email : "Not available",
                  ),
                  buildRow("DOB", data.dob?.toString() ?? "Not Available"),
                  //buildRow("Address", "Bangalore, India"),
                ]),

                buildSectionCard("Session History", [
                  buildRow("Last Session", "12 July 2025"),
                  buildRow("Last Notes", "Advised sleep journaling"),
                  buildRow("Feedback", "Improving, follow-up after 1 week"),
                ]),

                SizedBox(height: 30.h),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
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

  Widget buildHeaderSection(String image, String name, String gender) {
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
          CircleAvatar(radius: 30.r, backgroundImage: NetworkImage(image)),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // 'Ravi Sharma',
                name,
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                // 'APT20250726 · Male · 28 yrs',
                gender,
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
