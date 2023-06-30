import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Shared/Constants/constants.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = const Color.fromRGBO(173, 0, 255, 1)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeJoin = StrokeJoin.round;

    final height = (sqrt(3) / 2) * size.width;
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, height)
      ..lineTo(0, height)
      ..close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => false;
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/images/edit.png',
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: CircleAvatar(
              minRadius: 60,
              backgroundColor: const Color.fromRGBO(207, 207, 207, 1),
              child: Center(
                child: CustomPaint(
                  painter: TrianglePainter(),
                  size: const Size.fromRadius(40),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            interuser.get('name'),
            style: GoogleFonts.inter(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Text(
            interuser.get('email'),
            style: GoogleFonts.inter(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w200),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 300,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phone Number',
                style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextFormField(
              enabled: false,
              initialValue: interuser.get('phone'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(199, 199, 199, 1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(199, 199, 199, 1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(199, 199, 199, 1),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'E-mail Address',
                style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextFormField(
              enabled: false,
              initialValue: interuser.get('email'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(199, 199, 199, 1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(199, 199, 199, 1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(199, 199, 199, 1),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextFormField(
              enabled: false,
              initialValue: '***************',
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(199, 199, 199, 1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(199, 199, 199, 1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(199, 199, 199, 1),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
