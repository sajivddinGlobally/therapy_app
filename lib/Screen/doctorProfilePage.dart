import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:therapy_app/Screen/account.page.dart';
import 'package:therapy_app/Screen/change.password.page.dart';
import 'package:therapy_app/Screen/legal.policy.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({super.key});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
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
    }
    print("Camera Permission isDenied");
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
    }
    print("Gallery Permission isDenied");
  }

  Future showImage() async {
    showCupertinoModalPopup(
      context: context,
      builder:
          (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  pickImageFromCamera();
                  Navigator.pop(context);
                },
                child: Text("Camera"),
              ),

              CupertinoActionSheetAction(
                onPressed: () {
                  pickImageFromGallery();
                  Navigator.pop(context);
                },
                child: Text("Gallery"),
              ),
            ],
          ),
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
                                  // "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.png",
                                  fit: BoxFit.cover,
                                ),
                              )
                              : ClipOval(
                                child: Image.file(image!, fit: BoxFit.cover),
                              ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Text(
                  "Name",
                  style: GoogleFonts.nunito(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2B2B2B),
                    letterSpacing: -1,
                  ),
                ),
                Text(
                  "Email",
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
                  onTap: () async {},
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
                // if (token == null) ...[
                //   GestureDetector(
                //     onTap: () {},
                //     child: Row(
                //       children: [
                //         Icon(
                //           Icons.login,
                //           color: Color(0xFFF44336),
                //           size: 25.sp,
                //         ),
                //         SizedBox(width: 16.w),
                //         Text(
                //           "Login",
                //           style: GoogleFonts.inter(
                //             fontSize: 16.sp,
                //             fontWeight: FontWeight.w500,
                //             color: Color(0xFFF44336),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ] ,
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Color(0xFFF44336), size: 25.sp),
                      SizedBox(width: 16.w),
                      Text(
                        "Logout",
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
