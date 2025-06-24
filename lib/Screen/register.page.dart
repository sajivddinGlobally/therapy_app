import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/login.page.dart';
import 'package:therapy_app/Screen/profile.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/registerBodyModel.dart';
import 'package:therapy_app/data/provider/registerController.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isSecure = true;
  final _formKey = GlobalKey<FormState>();
  bool isRegister = false;
  @override
  Widget build(BuildContext context) {
    final registerProvider = ref.watch(registerFormProvider);
    final registerProviderData = ref.read(registerFormProvider.notifier);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: bgColor),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text(
                  "Hello! Register to get started",
                  style: GoogleFonts.nunito(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2B2B2B),
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(height: 30.h),
                Center(
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged:
                            (value) => registerProviderData.setEmail(value),
                        controller: emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
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
                            Icons.email_outlined,
                            color: Color(0xFFC8C8C8),
                            size: 24.sp,
                          ),
                          hintText: "Email",
                          hintStyle: GoogleFonts.inter(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFC8C8C8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$",
                          ).hasMatch(value)) {
                            return "Please Enter Valid Email Address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        onChanged:
                            (value) => registerProviderData.setPassword(value),
                        controller: passwordController,
                        obscureText: isSecure == true ? isSecure : false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
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
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Color(0xFFC8C8C8),
                            size: 24.sp,
                          ),
                          hintText: "Password",
                          hintStyle: GoogleFonts.inter(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFC8C8C8),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            child:
                                isSecure == true
                                    ? Icon(
                                      Icons.visibility_off_outlined,
                                      color: Color(0xFFC8C8C8),
                                      size: 24.sp,
                                    )
                                    : Icon(
                                      Icons.visibility_outlined,
                                      color: Color(0xFFC8C8C8),
                                      size: 24.sp,
                                    ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      GestureDetector(
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          setState(() => isRegister = true);
                          final form = ref.read(registerFormProvider);

                          if (form.email.isEmpty || form.password.isEmpty) {
                            Fluttertoast.showToast(
                              msg: "Please enter email and password",
                            );
                            setState(() => isRegister = false);
                            return;
                          }
                          try {
                            // ✅ Save to provider again (optional)
                            ref
                                .read(registerFormProvider.notifier)
                                .setEmail(emailController.text);
                            ref
                                .read(registerFormProvider.notifier)
                                .setPassword(passwordController.text);

                            Fluttertoast.showToast(msg: "Saved step 1");
                            // ✅ Navigate to next screen
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          } catch (e) {
                            Fluttertoast.showToast(
                              msg: "Something went wrong: $e",
                            );
                            setState(() => isRegister = false);
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
                                isRegister == false
                                    ? Text(
                                      "Register ",
                                      style: GoogleFonts.inter(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    )
                                    : CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xFFC8C8C8),
                        thickness: 1.w,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "Or Register with",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF868686),
                        letterSpacing: -1,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xFFC8C8C8),
                        thickness: 1.w,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Body(image: 'assets/f.png'),
                    Body(image: 'assets/goog.png'),
                    Body(image: 'assets/apple.png'),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 3.2),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.nunito(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2B2B2B),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Login Now",
                          style: GoogleFonts.nunito(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF15AC86),
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
      ),
    );
  }
}
