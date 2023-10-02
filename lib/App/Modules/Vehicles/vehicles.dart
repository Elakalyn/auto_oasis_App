// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Cubit/carCuibt.dart';
import '../../../Cubit/carStates.dart';
import '../../../Shared/Components/components.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                          onPressed: () {
                            CarCubit.get(context).selectFilter('Bugdet');
                          },
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
                          onPressed: () {
                            CarCubit.get(context).selectFilter('Comfort');
                          },
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
                          onPressed: () {
                            CarCubit.get(context).selectFilter('Luxury');
                          },
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


