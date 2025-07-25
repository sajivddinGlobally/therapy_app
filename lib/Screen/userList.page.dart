import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/Screen/userDetails.page.dart';
import 'package:therapy_app/Screen/userDetailsScreen.dart';
import 'package:therapy_app/constant/myColor.dart';
import 'package:therapy_app/data/provider/userListController.dart';

class UserListPage extends ConsumerStatefulWidget {
  const UserListPage({super.key});

  @override
  ConsumerState<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends ConsumerState<UserListPage> {
  List<Map<String, dynamic>> userList = [
    {
      "image": "assets/a1.jpg",
      "name": "Ahmed Khan",
      "specility": "Cardiologist",
      "exp": "2 years",
    },
    {
      "image": "assets/boys.png",
      "name": "Ahmed Khan",
      "specility": "Cardiologist",
      "exp": "4 years",
    },
    {
      "image": "assets/swiper.png",
      "name": "Ahmed Khan",
      "specility": "Cardiologist",
      "exp": "3 years",
    },
  ];
    final TextEditingController _searchController = TextEditingController();
  List<dynamic> filteredBookings = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {}); // UI refresh for filtered list
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final userListProvider = ref.watch(userListController);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: Text(
          "Upcoming",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
          ),
        ),
      ),
      body: userListProvider.when(
        data: (snap) {
              String query = _searchController.text.toLowerCase();
          List<dynamic>? bookings = snap.bookings;

          // ✅ Filter only by name
          filteredBookings = bookings!.where((booking) {
            final name = booking.user.name.toLowerCase();
            return name.contains(query);
          }).toList();

          return Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                TextField(
                     controller: _searchController,decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      top: 14.h,
                      bottom: 14.h,
                      right: 10.w,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color(0xffD9D9D9),
                        width: 0.93.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color(0xffD9D9D9),
                        width: 0.93.w,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search, color: Color(0xffD9D9D9)),
                    hintText: "Search...",
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Color(0xffBDBDBD),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: snap.bookings!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20.h),
                            padding: EdgeInsets.only(
                              left: 12.w,
                              right: 12.w,
                              top: 12.h,
                              bottom: 12.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: Color(0xffE4E4E7)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => UserDetailsPage(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        child: Image.network(
                                          //"assets/doctor1.png",
                                          //userList[index]['image'].toString(),
                                          snap
                                              .bookings![index]
                                              .user!
                                              .profilePicture
                                              .toString(),
                                          width: 72.w,
                                          height: 72.h,
                                          fit: BoxFit.cover,
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return Image.network(
                                              "https://demofree.sirv.com/nope-not-here.jpg",
                                              width: 90.w,
                                              height: 90.h,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // "Dr. Ahmed Khan",
                                            //userList[index]['name'].toString(),
                                            snap.bookings![index].user!.name.toString(),
                                            style: GoogleFonts.inter(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff18181B),
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            // "Cardiologist",
                                            // userList[index]['specility']
                                            //     .toString(),
                                            snap
                                                .bookings![index]
                                                .user!
                                                .specialization.toString(),
                                            style: GoogleFonts.inter(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                              color: buttonColor,
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.shopping_bag_outlined,
                                                color: Color(0xff71717A),
                                                size: 20.sp,
                                              ),
                                              SizedBox(width: 5.h),
                                              Text(
                                                "2 years",
                                                style: GoogleFonts.inter(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff71717A),
                                                ),
                                              ),
                                              SizedBox(width: 15.h),
                                              Icon(
                                                Icons.star_border,
                                                color: Color(0xff71717A),
                                                size: 20.sp,
                                              ),
                                              SizedBox(width: 5.h),
                                              Text(
                                                "4.8 ",
                                                style: GoogleFonts.inter(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff71717A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Divider(color: Color(0xffE4E4E7)),
                                SizedBox(height: 8.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "৳ 500.00",
                                      style: GoogleFonts.inter(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff18181B),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder:
                                                (context) =>
                                                    DoctorUserDetailsScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 64.w,
                                        height: 32.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          color: buttonColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Book",
                                            style: GoogleFonts.inter(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading:
            () => Center(child: CircularProgressIndicator(color: buttonColor)),
      ),
    );
  }
}
