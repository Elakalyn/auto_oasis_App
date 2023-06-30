import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bigText({
  required var text,
  var color,
  context,
  var weight,
  bool? textTheme,
}) =>
    Text(
      text,
      style: GoogleFonts.roboto(
          color: color,
          textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: weight,
              )),
    );

Widget uText({
  required var text,
  var color,
  context,
  var weight,
  bool? textTheme,
  var size,
}) =>
    Text(text,
        style: GoogleFonts.roboto(
          color: color,
          fontSize: size,
        ));

Future<void> navigateToAndFinish(context, widget) async =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Future<void> navigateTo(context, widget) async => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
