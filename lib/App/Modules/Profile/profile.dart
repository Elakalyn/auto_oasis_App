import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Cubit/carCubit.dart';
import '../../../Cubit/carStates.dart';
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

bool editing = false;
var ec = TextEditingController();
var nc = TextEditingController();
var pc = TextEditingController();

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  var _formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {
        if (state is EditProfileState) {
          editing = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    CarCubit.get(context).emitEditProfile();
                    print('EDITING IN PROGRESS');
                  },
                  child: editing
                      ? TextButton(
                          onPressed: () {
                            CarCubit.get(context).editProfile(
                                newPhone: pc.text, newEmail: ec.text);
                          },
                          child: Text('SAVE'),
                        )
                      : Image.asset(
                          'assets/images/edit.png',
                        ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
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
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    interuser.get('email'),
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w200),
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
                      enabled: editing,
                      controller: pc,
                      initialValue: interuser.get('phone'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(199, 199, 199, 1)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(199, 199, 199, 1)),
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
                      controller: ec,
                      enabled: editing,
                      initialValue: interuser.get('email'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(199, 199, 199, 1)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(199, 199, 199, 1)),
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
                      enabled: editing,
                      initialValue: editing ? '' : '***************',
                      decoration: InputDecoration(
                        hintText: editing
                            ? 'Please write your current password'
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(199, 199, 199, 1)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(199, 199, 199, 1)),
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
            ),
          ),
        );
      },
    );
  }
}
