import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:therapy_app/Screen/login.page.dart';
import 'package:therapy_app/Screen/question1.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/registerController.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  File? image;
  final picker = ImagePicker();

  // Future pickImageFromGallery() async {
  //   var status = await Permission.camera.request();
  //   if (status.isGranted) {
  //     final PickedFile = await picker.pickImage(source: ImageSource.gallery);
  //     if (PickedFile != null) {
  //       setState(() {
  //         image = File(PickedFile.path);
  //       });
  //     }
  //   } else {
  //     print("Galler Permission isdenied");
  //   }
  // }
  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = path.basename(picked.path);
      final permanentImage = await File(
        picked.path,
      ).copy('${directory.path}/$fileName');

      setState(() => image = permanentImage);
      ref
          .read(registerFormProvider.notifier)
          .setProfilePicture(permanentImage.path);
    } else {
      Fluttertoast.showToast(msg: "Image not picked");
    }
  }

  // Future pickImageFromCamera() async {
  //   var status = await Permission.camera.request();
  //   if (status.isGranted) {
  //     final picked = await picker.pickImage(source: ImageSource.camera);
  //     if (PickedFile != null) {
  //       setState(() {
  //         image = File(picked!.path);
  //       });

  //       ref.read(registerFormProvider.notifier).setProfilePicture(picked!.path);
  //     }
  //   } else {
  //     print("Camera Permission isdenied");
  //   }
  // }
  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);

    if (picked != null) {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = path.basename(picked.path);
      final permanentImage = await File(
        picked.path,
      ).copy('${directory.path}/$fileName');

      setState(() => image = permanentImage);
      ref
          .read(registerFormProvider.notifier)
          .setProfilePicture(permanentImage.path);
    } else {
      Fluttertoast.showToast(msg: "Image not picked");
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

  final _formKey = GlobalKey<FormState>();

  String? selectedGender;

  final List<String> genders = ['male', 'female', 'other'];

  String? selectedType;
  final List<String> typeList = ["patient", "therapist"];

  DateTime? selectedDate;
  final dateController = TextEditingController();

  // Future<void> pickDate() async {
  //   final DateTime? datePicked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );

  //   if (datePicked != null) {
  //     setState(() {
  //       selectedDate = datePicked;
  //       dateController.text = DateFormat('dd/MM/yyyy').format(datePicked);
  //     });
  //   }
  // }
  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      // final formatted = DateFormat('yyyy-MM-dd').format(picked);
      // dateController.text = formatted;

      // ref
      //     .read(registerFormProvider.notifier)
      //     .setDOB(formatted); // ✅ this line is critical
      final formatted = DateFormat('yyyy-MM-dd').format(picked);
      dateController.text = formatted; // ✅ 1. SET CONTROLLER VALUE
      ref
          .read(registerFormProvider.notifier)
          .setDOB(formatted); // ✅ 2. SET DOB TO STATE
    }
  }

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final registerProvider = ref.watch(registerFormProvider);
    final registerProviderData = ref.read(registerFormProvider.notifier);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "Complete Your Profile",
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
        child: Form(
          key: _formKey,
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
                              ? Center(
                                child: Icon(
                                  Icons.person,
                                  color: Color(0xFFE5E7EB),
                                  size: 80,
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
                      onChanged: (value) => registerProviderData.setName(value),
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
                          color: Color(0xFFC8C8C8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      onChanged:
                          (value) => registerProviderData.setPhone(value),
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
                          Icons.call,
                          color: Color(0xFFC8C8C8),
                          size: 20.sp,
                        ),
                        hintText: "Phone Number",
                        hintStyle: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFC8C8C8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Phone Number';
                        }
                        return null;
                      },
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
                        contentPadding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                        ),
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
                          color: Color(0xFFC8C8C8),
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
                          ref
                              .read(registerFormProvider.notifier)
                              .setGender(value!); // ✅ 2. GENDER SET TO STATE
                          selectedGender = value; // ✅ 1. LOCAL STATE UPDATED
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Select Gender";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    DropdownButtonFormField<String>(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF868686),
                      ),
                      padding: EdgeInsets.zero,
                      value: selectedType,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                        ),
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
                        "Type",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFC8C8C8),
                        ),
                      ),
                      items:
                          typeList.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          ref
                              .read(registerFormProvider.notifier)
                              .setUserType(value!);
                          selectedType = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Select Type";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    if (selectedType != "therapist")
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
                            color: Color(0xFFC8C8C8),
                          ),
                          hintText: "Date of Birth",
                          hintStyle: GoogleFonts.inter(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFC8C8C8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your date of birth';
                          }
                          return null;
                        },
                      ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              // Align(
              //   alignment: Alignment.center,
              //   child: GestureDetector(
              //     onTap: () async {
              //       if (!_formKey.currentState!.validate()) {
              //         return;
              //       }

              //       if (image == null) {
              //         Fluttertoast.showToast(
              //           msg: "Please upload image.",
              //           gravity: ToastGravity.BOTTOM,
              //           toastLength: Toast.LENGTH_SHORT,
              //           backgroundColor: Colors.red,
              //           textColor: Colors.white,
              //         );
              //         return;
              //       }
              //       setState(() => isLoading = true);

              //       if (selectedType != "therapist") {
              //         try {
              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setName(nameController.text);
              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setPhone(phoneController.text);
              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setGender(selectedGender!);
              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setDOB(dateController.text);

              //           // 🛠️ Only run if image is not null (already checked above)
              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setProfilePicture(image!.path);

              //           log(nameController.text);
              //           log(phoneController.text);
              //           log(selectedGender.toString());
              //           log(dateController.text);

              //           Fluttertoast.showToast(
              //             msg: "Saved step 2",
              //             gravity: ToastGravity.BOTTOM,
              //             toastLength: Toast.LENGTH_SHORT,
              //             backgroundColor: buttonColor,
              //             textColor: Colors.white,
              //           );
              //           Navigator.push(
              //             context,
              //             CupertinoPageRoute(
              //               builder: (context) => Question1Page(),
              //             ),
              //           );
              //         } catch (e) {
              //           Fluttertoast.showToast(msg: "Something went wrong: $e");
              //         } finally {
              //           setState(() => isLoading = false);
              //         }
              //       } else {
              //         try {
              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setName(nameController.text);
              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setPhone(phoneController.text);
              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setGender(selectedGender!);
              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setUserType(selectedType!);

              //           // 🛠️ Only run if image is not null (already checked above)
              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setProfilePicture(image!.path);

              //           ref
              //               .read(registerFormProvider.notifier)
              //               .setCategoryId(1);

              //           await ref
              //               .read(registerFormProvider.notifier)
              //               .registerUser();

              //           log(nameController.text);
              //           log(phoneController.text);
              //           log(selectedGender.toString());
              //           log(selectedType!);

              //           Fluttertoast.showToast(
              //             msg: "Saved step ",
              //             gravity: ToastGravity.BOTTOM,
              //             toastLength: Toast.LENGTH_SHORT,
              //             backgroundColor: buttonColor,
              //             textColor: Colors.white,
              //           );
              //           Navigator.push(
              //             context,
              //             CupertinoPageRoute(builder: (context) => LoginPage()),
              //           );
              //         } catch (e) {
              //           Fluttertoast.showToast(msg: "Something went wrong: $e");
              //         } finally {
              //           setState(() => isLoading = false);
              //         }
              //       }
              //     },
              //     child: Container(
              //       width: 327.w,
              //       height: 56.h,
              //       decoration: BoxDecoration(
              //         color: buttonColor,
              //         borderRadius: BorderRadius.circular(14.r),
              //       ),
              //       child: Center(
              //         child:
              //             isLoading
              //                 ? Center(
              //                   child: CircularProgressIndicator(
              //                     color: Colors.white,
              //                   ),
              //                 )
              //                 : Text(
              //                   "Continue",
              //                   style: GoogleFonts.inter(
              //                     fontSize: 16.sp,
              //                     fontWeight: FontWeight.w500,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //       ),
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () async {
                    if (!_formKey.currentState!.validate()) return;

                    if (image == null) {
                      Fluttertoast.showToast(
                        msg: "Please upload image.",
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                      return;
                    }

                    setState(() => isLoading = true);

                    try {
                      final Notifier = ref.read(registerFormProvider.notifier);

                      Notifier.setName(nameController.text);
                      Notifier.setPhone(phoneController.text);
                      Notifier.setGender(selectedGender!);
                      Notifier.setProfilePicture(image!.path);

                      if (selectedType != "therapist") {
                        Notifier.setDOB(dateController.text);
                        await Future.delayed(
                          Duration(milliseconds: 200),
                        ); // Optional
                        Fluttertoast.showToast(
                          msg: "Saved step 2",
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: buttonColor,
                          textColor: Colors.white,
                        );
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (_) => Question1Page()),
                        );
                      } else {
                        Notifier.setUserType(selectedType!);
                        Notifier.setCategoryId(1);
                        await Notifier.registerUser();

                        Fluttertoast.showToast(
                          msg: "Registeration Successfull",
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: buttonColor,
                          textColor: Colors.white,
                        );
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (_) => LoginPage()),
                        );
                      }
                    } catch (e) {
                      Fluttertoast.showToast(msg: "Something went wrong: $e");
                    } finally {
                      setState(() => isLoading = false);
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
                              ? CircularProgressIndicator(color: Colors.white)
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
