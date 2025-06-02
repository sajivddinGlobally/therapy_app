import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_app/constant/myColor.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messafeController = TextEditingController();

  // ✅ Add message list
  final List<Map<String, dynamic>> _messages = [];

  void _handleSendMessage() {
    final text = messafeController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({'text': text, 'isSender': true});
      });
      messafeController.clear();
    }
  }

  @override
  void initState() {
    super.initState();

    // ✅ Optional: preload some messages
    _messages.addAll([
      {'text': "Hey there! 👋", 'isSender': false},
      {'text': "Sunday at 10 AM does this work for you", 'isSender': false},
      {'text': "Hi!", 'isSender': true},
      {'text': "Awesome, thanks for letting me know!", 'isSender': true},
      {
        'text': "No problem at all! I'll be there in about 15 minutes.",
        'isSender': false,
      },
      {'text': "I'll text you when I arrive.", 'isSender': false},
      {'text': "Great! 😊", 'isSender': true},
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Dr. Aaron ",
          style: GoogleFonts.nunito(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2B2B2B),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                reverse: false,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: ChatBubble(
                      message: message['text'],
                      isSender: message['isSender'],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
      bottomSheet: MessageInput(
        controller: messafeController,
        onSend: _handleSendMessage,
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 17.h,
                    bottom: 17.h,
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.r),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Type a message ...",
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFC8C8C8),
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: onSend,
              child: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: buttonColor,
                ),
                child: Center(
                  child: Icon(
                    Icons.send_sharp,
                    color: Colors.white,
                    size: 28.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;
  const ChatBubble({super.key, required this.message, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isSender ? buttonColor : Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(isSender ? 16.r : 0),
            bottomRight: Radius.circular(isSender ? 0 : 16.r),
          ),
        ),
        child: Text(
          message,
          style: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: isSender ? Colors.white : Color(0xFF2B2B2B),
            letterSpacing: -1,
          ),
        ),
      ),
    );
  }
}
