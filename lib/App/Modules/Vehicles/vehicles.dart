// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Cubit/carCuibt.dart';
import '../../../Cubit/carStates.dart';
import '../../../Shared/Components/components.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        final CollectionReference collectionRef =
            FirebaseFirestore.instance.collection('vehicles');
        dynamic taggedCarsRef = collectionRef.where('category',
            isEqualTo: CarCubit.get(context).filter);
        List<CarAd> popular = [
          CarAd(
            car_image:
                'https://firebasestorage.googleapis.com/v0/b/car-app-410f4.appspot.com/o/fiat_pulse.png?alt=media&token=fccb1363-e338-4349-a280-ae95be5d5219',
            car_brand:
                'https://firebasestorage.googleapis.com/v0/b/car-app-410f4.appspot.com/o/fiat_logo.png?alt=media&token=62e76adf-2a81-41bb-ae6c-e2c1c22361a7',
            car_price: '200',
            car_name: 'Fiat Pulse',
            car_type: 'SUV',
            car_year: '2019',
            brand_name: 'Fiat',
          ),
          CarAd(
            car_image:
                'https://firebasestorage.googleapis.com/v0/b/car-app-410f4.appspot.com/o/2019camry.png?alt=media&token=f9c31b93-74aa-4dc7-ab58-dce885cb64b0',
            car_brand:
                'https://firebasestorage.googleapis.com/v0/b/car-app-410f4.appspot.com/o/toyota_logo.png?alt=media&token=d0a79c5f-9869-4fc0-b08b-7af30ce41978',
            car_price: '50',
            car_name: 'Toyota Camry',
            car_type: 'Sedan',
            car_year: '2019',
            brand_name: 'Toyota',
          ),
          CarAd(
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
        ];
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
                            if (CarCubit.get(context).filter != 'Budget') {
                              CarCubit.get(context).selectFilter('Budget');
                            } else {
                              CarCubit.get(context).filter = null;
                              CarCubit.get(context).filtering = false;
                              CarCubit.get(context).emit(Filtering());
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.5),
                            ),
                          ),
                          icon: const Icon(Icons.currency_pound_sharp,
                              size: 20, color: Color(0xFF007D05)),
                          label: Text(
                            'Budget',
                            style: TextStyle(
                                fontSize: 12,
                                color: CarCubit.get(context).chipColor),
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
                            if (CarCubit.get(context).filter != 'Comfort') {
                              CarCubit.get(context).selectFilter('Comfort');
                            } else {
                              CarCubit.get(context).filter = null;
                              CarCubit.get(context).filtering = false;
                              CarCubit.get(context).emit(Filtering());
                            }
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
                            if (CarCubit.get(context).filter != 'Luxury') {
                              CarCubit.get(context).selectFilter('Luxury');
                            } else {
                              CarCubit.get(context).filter = null;
                              CarCubit.get(context).filtering = false;
                              CarCubit.get(context).emit(Filtering());
                            }
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
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlay: true,
                  height: 140,
                  viewportFraction: 1,
                ),
                itemCount: 3,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: popular[itemIndex],
                  );
                }),
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
                  style: TextStyle(
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
                stream: CarCubit.get(context).filtering
                    ? taggedCarsRef.snapshots()
                    : collectionRef.snapshots(),
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
