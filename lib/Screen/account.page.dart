import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:therapy_app/Screen/change.password.page.dart';
import 'package:therapy_app/Screen/edit.profile.page.dart';
import 'package:therapy_app/Screen/home.page.dart';
import 'package:therapy_app/Screen/language.page.dart';
import 'package:therapy_app/Screen/legal.policy.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  File? image;
  final picker = ImagePicker();

  Future pickImageFromGallery() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final PickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (PickedFile != null) {
        setState(() {
          image = File(PickedFile.path);
        });
      }
    } else {
      print("Gallery Permission isdenied");
    }
  }

  Future pickImageFromCamera() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final PickedFile = await picker.pickImage(source: ImageSource.camera);
      if (PickedFile != null) {
        setState(() {
          image = File(PickedFile.path);
        });
      }
    } else {
      print("Camera Permission isdenied");
    }
  }

  Future showImage() async {
    showCupertinoModalPopup(
      context: context,
      builder:
          (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  pickImageFromGallery();
                },
                child: Text("Gallery"),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  pickImageFromCamera();
                },
                child: Text("Camera"),
              ),
            ],
          ),
    );
  }

  void showbottomsheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 190.h,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.r),
              topRight: Radius.circular(35.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Container(
                width: 100.w,
                height: 2.63.h,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Logout",
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2B2B2B),
                  letterSpacing: -1,
                ),
              ),
              // SizedBox(height: 15.h),
              // Divider(color: Colors.black12, endIndent: 20, indent: 20),
              SizedBox(height: 15.h),
              Text(
                "Are you sure you want to log out?",
                style: GoogleFonts.nunito(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4F4F4F),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 162.w,
                      height: 43.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.76.r),
                        border: Border.all(color: Color(0xFF15AC86)),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.nunito(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: buttonColor,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Container(
                      width: 162.w,
                      height: 43.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF15AC86),
                        borderRadius: BorderRadius.circular(8.76.r),
                      ),
                      child: Center(
                        child: Text(
                          "Yes Logout",
                          style: GoogleFonts.nunito(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 150.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF5F5F7),
                      ),
                      child:
                          image == null
                              ? ClipOval(
                                child: Image.asset(
                                  "assets/frame.png",
                                  fit: BoxFit.cover,
                                ),
                              )
                              : Image.file(image!, fit: BoxFit.cover),
                    ),
                    Positioned(
                      right: 10.w,
                      bottom: 10.h,
                      child: GestureDetector(
                        onTap: () {
                          showImage();
                        },
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: buttonColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Text(
                  "Alicent Hightower",
                  style: GoogleFonts.nunito(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2B2B2B),
                    letterSpacing: -1,
                  ),
                ),
                Text(
                  "alicent@gmail.com",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF868686),
                    letterSpacing: -1,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Divider(color: Colors.black12, endIndent: 10, indent: 10),
                SizedBox(height: 24.h),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => EditProfilePage(),
                      ),
                    );
                  },
                  child: EditProfileBody(
                    icon: Icons.person_outline_outlined,
                    txt: 'Edit Profile',
                  ),
                ),
                SizedBox(height: 25.h),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ChangePasswordPage(),
                      ),
                    );
                  },
                  child: EditProfileBody(
                    icon: Icons.lock_outline,
                    txt: 'Change Password',
                  ),
                ),
                SizedBox(height: 25.h),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => LanguagePage()),
                    );
                  },
                  child: EditProfileBody(
                    icon: Icons.language_outlined,
                    txt: 'Languages',
                  ),
                ),
                SizedBox(height: 25.h),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => LegalPolicyPage(),
                      ),
                    );
                  },
                  child: EditProfileBody(
                    icon: Icons.policy_outlined,
                    txt: 'Legal and Policies',
                  ),
                ),
                SizedBox(height: 25.h),
                EditProfileBody(
                  icon: Icons.help_outline_sharp,
                  txt: 'Help and Support',
                ),
                SizedBox(height: 25.h),
                GestureDetector(
                  onTap: () {
                    showbottomsheet();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.login_outlined,
                        color: Color(0xFFF44336),
                        size: 25.sp,
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        "Login",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF44336),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfileBody extends StatelessWidget {
  final IconData icon;
  final String txt;
  const EditProfileBody({super.key, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFF2B2B2B), size: 25.sp),
        SizedBox(width: 16.w),
        Text(
          txt,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2B2B2B),
          ),
        ),
        Spacer(),
        Icon(Icons.keyboard_arrow_right, color: Color(0xFF2B2B2B), size: 26.w),
      ],
    );
  }
}
