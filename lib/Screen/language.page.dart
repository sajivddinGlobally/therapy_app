import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/constant/myColor.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLanguage = 'English';

  final List<String> languages = ['English (UK)', 'English', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Language",
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
        padding: EdgeInsets.only(left: 24.w, right: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Suggested Languages",
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2B2B2B),
                letterSpacing: -1,
              ),
            ),
            SizedBox(height: 10.h),
            Column(
              children:
                  languages.map((lang) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLanguage = lang;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F6F9),
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(
                            color:
                                selectedLanguage == lang
                                    ? Color(0xFF15AC86)
                                    : Colors.grey,
                            width: 1.w,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lang,
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2B2B2B),
                                letterSpacing: -1,
                              ),
                            ),
                            if (selectedLanguage == lang)
                              Icon(
                                Icons.done,
                                color: Color(0xFF15AC86),
                                size: 20.sp,
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
