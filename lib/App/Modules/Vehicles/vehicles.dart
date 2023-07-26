// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Cubit/carCuibt.dart';
import '../../../Cubit/carStates.dart';
import '../../../Shared/Components/components.dart';
import '../CarDetails/carDetails.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var f1_selected = false;
    var f2_selected = false;
    var f3_selected = false;
    var f4_selected = false;
    var f5_selected = false;
    var f6_selected = false;

    var b1_selected = false;
    var b2_selected = false;
    var b3_selected = false;
    var b4_selected = false;
    var b5_selected = false;
    var b6_selected = false;
    var b7_selected = false;
    var b8_selected = false;
    var b9_selected = false;
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        final CollectionReference collectionRef =
            FirebaseFirestore.instance.collection('vehicles');
        return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            searchBar(),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 110,
                        maxHeight: 35,
                      ),
                      child: OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.5),
                            ),
                          ),
                          icon: const Icon(Icons.currency_pound_sharp,
                              size: 20, color: Color(0xFF007D05)),
                          label: const Text(
                            'Budget',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          )),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 112,
                        maxHeight: 35,
                      ),
                      child: OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFFBFFFC2),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF007D05)),
                              borderRadius: BorderRadius.circular(8.5),
                            ),
                          ),
                          icon: const Icon(
                            Icons.stream,
                            size: 14,
                            color: Colors.black,
                          ),
                          label: const Text(
                            'Comfort',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 110,
                        maxHeight: 35,
                      ),
                      child: OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFFBFC9FF),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF18238D)),
                              borderRadius: BorderRadius.circular(8.5),
                            ),
                          ),
                          icon: SizedBox(
                            width: 19.12,
                            height: 19.12,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 19.12,
                                    height: 19.12,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFEAFF00),
                                      shape: StarBorder(
                                        side: BorderSide(width: 0.53),
                                        points: 5,
                                        innerRadiusRatio: 0.38,
                                        pointRounding: 0,
                                        valleyRounding: 0,
                                        rotation: 0,
                                        squash: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          label: const Text(
                            'Luxury',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: double.maxFinite,
                          height: 500,
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Number of cars:',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '600',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Features',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: Wrap(
                                        spacing: 4,
                                        runSpacing: 2,
                                        children: [
                                          ActionChip(
                                            backgroundColor: f1_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: f1_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Air Conditioner',
                                              style: TextStyle(
                                                  color: f1_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (f1_selected == true) {
                                                f1_selected = false;
                                              } else {
                                                f1_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: f2_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: f2_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'FM/AM Radio',
                                              style: TextStyle(
                                                  color: f2_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (f2_selected == true) {
                                                f2_selected = false;
                                              } else {
                                                f2_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: f3_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: f3_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Bluetooth',
                                              style: TextStyle(
                                                  color: f3_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (f3_selected == true) {
                                                f3_selected = false;
                                              } else {
                                                f3_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: f4_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: f4_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'USB Charger',
                                              style: TextStyle(
                                                  color: f4_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (f4_selected == true) {
                                                f4_selected = false;
                                              } else {
                                                f4_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: f5_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: f5_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Airbag',
                                              style: TextStyle(
                                                  color: f5_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (f5_selected == true) {
                                                f5_selected = false;
                                              } else {
                                                f5_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: f6_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: f6_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Touch Screen',
                                              style: TextStyle(
                                                  color: f6_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (f6_selected == true) {
                                                f6_selected = false;
                                              } else {
                                                f6_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Brands',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Wrap(
                                        spacing: 4,
                                        runSpacing: 2,
                                        children: [
                                          ActionChip(
                                            backgroundColor: b1_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: b1_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Kia',
                                              style: TextStyle(
                                                  color: b1_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (b1_selected == true) {
                                                b1_selected = false;
                                              } else {
                                                b1_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: b2_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: b2_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Citroen',
                                              style: TextStyle(
                                                  color: b2_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (b2_selected == true) {
                                                b2_selected = false;
                                              } else {
                                                b2_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: b3_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: b3_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Ford',
                                              style: TextStyle(
                                                  color: b3_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (b3_selected == true) {
                                                b3_selected = false;
                                              } else {
                                                b3_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: b4_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: b4_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Fiat',
                                              style: TextStyle(
                                                  color: b4_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (b4_selected == true) {
                                                b4_selected = false;
                                              } else {
                                                b4_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: b5_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: b5_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Tesla',
                                              style: TextStyle(
                                                  color: b5_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (b5_selected == true) {
                                                b5_selected = false;
                                              } else {
                                                b5_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: b6_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: b6_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Honda',
                                              style: TextStyle(
                                                  color: b6_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (b6_selected == true) {
                                                b6_selected = false;
                                              } else {
                                                b6_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: b7_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: b7_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Mercedes-Benz',
                                              style: TextStyle(
                                                  color: b7_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (b7_selected == true) {
                                                b7_selected = false;
                                              } else {
                                                b7_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: b8_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: b8_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Toyota',
                                              style: TextStyle(
                                                  color: b8_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (b8_selected == true) {
                                                b8_selected = false;
                                              } else {
                                                b8_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                          ActionChip(
                                            backgroundColor: b9_selected
                                                ? const Color(0xFF6750A4)
                                                : const Color.fromRGBO(
                                                    232, 232, 232, 1),
                                            avatar: b9_selected
                                                ? const Icon(Icons.remove,
                                                    color: Colors.white)
                                                : const Icon(Icons.add),
                                            label: Text(
                                              'Hyundai',
                                              style: TextStyle(
                                                  color: b9_selected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            onPressed: () {
                                              if (b9_selected == true) {
                                                b9_selected = false;
                                              } else {
                                                b9_selected = true;
                                              }
                                              CarCubit.get(context)
                                                  .selectFeature();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 56,
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                      )),
                                                  style: ButtonStyle()),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: 56,
                                              child: FilledButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Save',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                      )),
                                                  style: ButtonStyle()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: 39.38,
                                padding: const EdgeInsets.all(17.50),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.40,
                                      child: Container(
                                        width: 35,
                                        height: 4.38,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFF79747E),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(109.38),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  label: const Text(
                    'Filter',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              width: 300,
              color: const Color(0xFFCAC4D0),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  'Most popular',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CarAd(
                car_image:
                    'https://media.discordapp.net/attachments/673875945198714920/1132035875476340816/citroen_cactus.webp?width=781&height=610',
                car_brand:
                    'https://media.discordapp.net/attachments/673875945198714920/1132035875207917708/citroen_logo.png?width=661&height=610',
                car_price: '75',
                car_name: 'Citroen Cactus',
                car_type: 'SUV',
                car_year: '2017',
                brand_name: 'Citroen',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  'Top matches',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: StreamBuilder<QuerySnapshot?>(
                stream: collectionRef.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  final QuerySnapshot? querySnapshot = snapshot.data;

                  if (querySnapshot == null) {
                    print('DATA DOES NOT EXIST.');
                    return bigText(
                        text: 'No data available', color: Colors.black);
                  }

                  return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 20,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: querySnapshot.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final DocumentSnapshot<Object?> document =
                          querySnapshot.docs[index];

                      return CarAd(
                        car_image: document['vehicle_image'],
                        car_brand: document['brand_image'],
                        car_price: document['vehicle_price'],
                        car_year: document['year'],
                        car_name: document['vehicle_name'],
                        car_type: document['vehicle_type'],
                        brand_name: document['vehicle_brand'],
                      );
                    },
                  );
                },
              ),
            ),
          ]),
        )));
      },
    );
  }
}

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
    this.settings = false,
  });

  final settings;

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
      child: TextField(
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: suffixWidget,
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          fillColor: const Color.fromRGBO(227, 227, 227, 1),
          hintText: settings ? 'Search in settings' : 'Search for a vehicle',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(45)),
        ),
      ),
    );
  }
}

List<CarAd> mockAds = [
  CarAd(
      brand_name: 'Citroen',
      car_image:
          'https://media.discordapp.net/attachments/673875945198714920/1132035875476340816/citroen_cactus.webp?width=781&height=610',
      car_brand:
          'https://media.discordapp.net/attachments/673875945198714920/1132035875207917708/citroen_logo.png?width=661&height=610',
      car_price: '75',
      car_name: 'Citroen Cactus',
      car_type: 'SUV',
      car_year: '2017')
];

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
