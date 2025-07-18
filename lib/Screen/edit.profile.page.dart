import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/profileUpdateController.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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

  String? selectedGender;

  final List<String> genders = ['male', 'female', 'other'];

  DateTime? selectedDate;
  final dateController = TextEditingController();
  Future<void> pickDate() async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (datePicked != null) {
      setState(() {
        selectedDate = datePicked;
        dateController.text = DateFormat('dd/MM/yyyy').format(datePicked);
      });
    }
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
            letterSpacing: -1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Center(
              child: Stack(
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
                            : ClipOval(
                              child: Image.file(image!, fit: BoxFit.cover),
                            ),
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.h, top: 20.h),
              child: Column(
                children: [
                  TextFormField(
                    //initialValue: "Name",
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10.w),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      hintText: "Name",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    maxLength: 10,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.wifi_calling_3_outlined,
                        color: Color(0xFF2B2B2B),
                        size: 20.sp,
                      ),
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    //initialValue: "",
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10.w),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Color(0xFF2B2B2B),
                        size: 20.sp,
                      ),
                      hintText: "Email",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  DropdownButtonFormField<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF868686),
                    ),
                    padding: EdgeInsets.zero,
                    value: selectedGender,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(left: 10.w, right: 10.w),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                    ),
                    hint: Text(
                      "Gender",
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                    items:
                        genders.map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    onTap: () {
                      pickDate();
                    },
                    controller: dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10.w),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(
                          color: Color(0xFFC8C8C8),
                          width: 1.w,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.date_range_outlined,
                        color: Color(0xFF2B2B2B),
                      ),
                      hintText: "Date of Birth",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () async {
                      if (image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please Select image")),
                        );
                      }
                      try {
                        setState(() {
                          isLoading = true;
                        });
                        await UpdateProfileController.profileUpdate(
                          context: context,
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          gender: selectedGender!,
                          dob: selectedDate.toString(),
                          profile_picture: image,
                        );
                      } catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                        log(e.toString());
                        Fluttertoast.showToast(msg: "Something went wrong");
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
                                  "Save",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
