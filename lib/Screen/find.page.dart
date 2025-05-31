import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapy_app/Screen/available.therapy.page.dart';
import 'package:therapy_app/constant/myColor.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => AvailableTherapyPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(child: Image.asset("assets/find.png")),
    );
  }
}
