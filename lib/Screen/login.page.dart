import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/forgot.password.page.dart';
import 'package:therapy_app/Screen/home.page.dart';
import 'package:therapy_app/Screen/register.page.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/model/loginBodyModel.dart';
import 'package:therapy_app/data/provider/login.state.dart';
import 'package:therapy_app/data/provider/loginController.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isSecure = true;
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: bgColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Text(
                "Welcome back! Glad to see you, Again!",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B2B2B),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 30.h),
              Center(
                child: Column(
                  children: [
                    TextFormField(
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
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: 327.w,
                      height: 56.h,
                      child: TextFormField(
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
                    ),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ForgotPasswordPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4F4F4F),
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    InkWell(
                      onTap: () async {
                        // done method sahi hai
                        // setState(() {
                        //   isLogin = true;
                        // });
                        // final body = LoginBodyModel(
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        // );
                        // try {
                        //   final loginservice = ApiStateNetwork(
                        //     await createDio(),
                        //   );
                        //   final data = compute(loginservice.login, body);
                        //   final response = await data;
                        //   if (response != null) {
                        //     Fluttertoast.showToast(msg: response.message);
                        //     Navigator.push(
                        //       context,
                        //       CupertinoPageRoute(
                        //         builder: (context) => HomePage(),
                        //       ),
                        //     );
                        //   } else {
                        //     log("failed");
                        //     Fluttertoast.showToast(msg: "failed");
                        //   }
                        // } catch (e) {
                        //   setState(() {
                        //     isLogin = false;
                        //   });
                        //   Fluttertoast.showToast(msg: "something went wrong");
                        // }
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please fill correct data")),
                          );
                          return;
                        }

                        setState(() {
                          isLogin = true;
                        });
                        try {
                          // showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return Center(
                          //       child: AlertDialog(
                          //         backgroundColor: Colors.transparent,
                          //         actions: [
                          //           Center(child: CircularProgressIndicator()),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // );
                          final body = LoginBodyModel(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          await ref
                              .read(logincontrollerprovider.notifier)
                              .login(body);
                          final loginState = ref.read(logincontrollerprovider);

                          if (loginState is LoginSuccess) {
                            Fluttertoast.showToast(
                              msg: loginState.response.message,
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: buttonColor,
                              textColor: Color(0xFFFFFFFF),
                            );
                            if (!mounted)
                              return; // ✅ Safety check for navigation
                            Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          } else if (loginState is LoginError) {
                            setState(() {
                              isLogin = false;
                            });
                            log(loginState.message);
                            Fluttertoast.showToast(
                              msg: "Invalid email and password",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_LONG,
                              backgroundColor: Colors.red,
                              textColor: Color(0xFFFFFFFF),
                            );
                          }
                        } catch (e) {
                          setState(() {
                            isLogin = false;
                          });
                          Fluttertoast.showToast(
                            msg: "Something Went Wrong",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.red,
                            textColor: Color(0xFFFFFFFF),
                          );
                          log(e.toString());
                        }
                        setState(() {
                          isLogin = false;
                        });
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
                              isLogin == false
                                  ? Text(
                                    "Login",
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  )
                                  : CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.w, // ✅ thinner and faster
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
                    child: const Divider(
                      color: Color(0xFFC8C8C8),
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "Or Login with",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF868686),
                      letterSpacing: -1,
                    ),
                  ),
                  Expanded(
                    child: const Divider(
                      color: Color(0xFFC8C8C8),
                      thickness: 1,
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
              SizedBox(height: MediaQuery.of(context).size.height / 4),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B2B2B),
                        letterSpacing: -1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Register Now",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF15AC86),
                          letterSpacing: -1,
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

class Body extends StatelessWidget {
  final String image;
  const Body({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101.w,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Color(0xFFC8C8C8), width: 1.w),
      ),
      child: Center(child: Image.asset(image)),
    );
  }
}
