// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../App/Modules/CarDetails/carDetails.dart';
import '../../App/Modules/Search/search.dart';
import '../../Cubit/carCuibt.dart';

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

class CarAd extends StatelessWidget {
  CarAd(
      {super.key,
      required this.car_image,
      required this.car_brand,
      required this.brand_name,
      required this.car_price,
      required this.car_name,
      required this.car_type,
      required this.car_year});

  var car_image;
  var car_brand;
  var car_type;
  var car_name;
  var car_price;
  var car_year;
  var brand_name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (val) {},
      onTap: () {
        navigateTo(
            context,
            CarDetails(
              car_image: car_image,
              car_brand: car_brand,
              car_name: car_name,
              brand_name: brand_name,
            ));
      },
      child: SizedBox(
        width: 360,
        height: 115,
        child: Row(
          children: [
            Container(
              width: 155,
              height: 115,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(car_image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                SizedBox(
                  width: 155,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      car_name,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 23.34,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 155,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '$car_price\$/Day',
                      style: const TextStyle(
                        color: Color(0xFF188D1D),
                        fontSize: 13.41,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 155,
                  height: 37,
                  child: FilledButton(
                      onPressed: () {},
                      child: const Text('Rent'),
                      style: const ButtonStyle()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
    this.settings = false,
    this.search = false,
  });

  final settings;
  final search;

  @override
  Widget build(BuildContext context) {
    late Widget suffixWidget;
    if (settings == true) {
      suffixWidget = IconButton(
        icon: Image.asset(
          'assets/Icons/settings_Icon.png',
        ),
        onPressed: () {},
      );
    } else {
      suffixWidget = IconButton(
        icon: Image.asset(
          'assets/images/onboarding_car.png',
        ),
        onPressed: () {},
      );
    }
    return Container(
      height: 90,
      padding: const EdgeInsets.only(top: 34, left: 15, right: 15),
      child: InkWell(
        onTap: () {
          if (search == false) {
            navigateTo(context, SearchScreen());
          }
        },
        child: TextField(
          onChanged: (value) {
            CarCubit.get(context).searchQuery = value;
          },
          onSubmitted: (value) {
            CarCubit.get(context).performSearch();
          },
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: suffixWidget,
            filled: true,
            enabled: search,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            fillColor: const Color.fromRGBO(227, 227, 227, 1),
            hintText: settings ? 'Search in settings' : 'Search for a vehicle',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(45)),
          ),
        ),
      ),
    );
  }
}