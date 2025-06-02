import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/chat.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class ChatInboxPage extends StatefulWidget {
  const ChatInboxPage({super.key});

  @override
  State<ChatInboxPage> createState() => _ChatInboxPageState();
}

class _ChatInboxPageState extends State<ChatInboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: Text(
          "Messages",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF4F6F9),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF2B2B2B),
                  size: 25.sp,
                ),
                hintText: "Search...",
                hintStyle: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF868686),
                ),
                suffixIcon: Icon(
                  Icons.tune_outlined,
                  color: Color(0xFF868686),
                  size: 25.sp,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ChatPage(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 58.w,
                                height: 58.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/dot.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr. Aaron ",
                                    style: GoogleFonts.inter(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2B2B2B),
                                      letterSpacing: -1,
                                      height: 1.0,
                                    ),
                                  ),
                                  Text(
                                    "Now how yo feel? ",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF868686),
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "15:23",
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF868686),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    width: 16.w,
                                    height: 16.w, // Make it square
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: buttonColor,
                                    ),

                                    child: Center(
                                      child: Text(
                                        "1",
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xFFF4F6F9),
                          endIndent: 10,
                          indent: 10,
                          thickness: 1.w,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
