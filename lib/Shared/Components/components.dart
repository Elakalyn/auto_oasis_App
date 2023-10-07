// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../App/Modules/CarDetails/carDetails.dart';
import '../../App/Modules/Profile/profile.dart';
import '../../App/Modules/Rent/rent.dart';
import '../../App/Modules/Search/search.dart';
import '../../App/Modules/Settings/settings.dart';
import '../../Cubit/carCubit.dart';
import '../../Cubit/carStates.dart';
import '../Styles/styles.dart';

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
                        color: Color.fromARGB(
                            255, 53, 201, 61), //Color(0xFF188D1D)
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
                      onPressed: () {
                        navigateTo(context, RentVehicle(vehicleName: car_name));
                      },
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
            navigateTo(context, const SearchScreen());
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

class settingWidget extends StatelessWidget {
  const settingWidget({
    super.key,
    required this.name,
    required this.image,
  });

  final image;
  final name;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            switch (name) {
              case 'Account':
                navigateTo(context, UserProfile());
                break;
              case 'Payment':
                navigateTo(context, const Payment());
                break;
              case 'Language':
                navigateTo(context, const Language());
                break;
              case 'Rent History':
                navigateTo(context, const RentHistory());
                break;
              case 'Appearance':
                navigateTo(context, const Appearance());
                break;
            }
          },
          child: Container(
            width: 148,
            height: 148,
            decoration: BoxDecoration(
              color: CarCubit.get(context).settingWidgetColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                  child: Column(
                children: [
                  Expanded(
                    child: Image.asset(image,
                        width: 70,
                        height: 70,
                        color: CarCubit.get(context).settingIconColor),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  )
                ],
              )),
            ),
          ),
        );
      },
    );
  }
}
