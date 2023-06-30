// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Cubit/carCuibt.dart';
import '../../../Cubit/carStates.dart';
import '../../../Shared/Components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              child: Column(
                children: [
                  Container(
                    height: 90,
                    padding:
                        const EdgeInsets.only(top: 34, left: 15, right: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: Image.asset(
                            'assets/images/onboarding_car.png',
                          ),
                          onPressed: () {
                            // Clear the search field
                          },
                        ),
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        fillColor: const Color.fromRGBO(227, 227, 227, 1),
                        hintText: 'Search for a vehicle',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 80,
                      width: 360,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(195, 195, 195, 1)),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(195, 195, 195, 1),
                                  borderRadius: BorderRadius.circular(18)),
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Image.asset(
                            'assets/images/model_Y.png',
                          ),
                          // Add this SizedBox
                          const Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Model Y',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    )),
                                Text('Sedan',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w200,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 80,
                      width: 360,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(195, 195, 195, 1)),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(195, 195, 195, 1),
                                  borderRadius: BorderRadius.circular(18)),
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Image.asset(
                            'assets/images/model_Y.png',
                          ),
                          // Add this SizedBox
                          const Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Model Y',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    )),
                                Text('Sedan',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w200,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Trending Vehicles',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: StreamBuilder<QuerySnapshot?>(
                      stream: collectionRef.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                            height: 10,
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
                                car_type: document['vehicle_type']);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CarAd extends StatelessWidget {
  CarAd(
      {super.key,
      required this.car_image,
      required this.car_brand,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(195, 195, 195, 1),
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: GestureDetector(
        onTap: () {
          print('Clicked');
        },
        child: Stack(
          children: [
            Positioned(
              right: -250,
              top: -100,
              child: ClipRRect(
                child: Image.network(
                  '$car_image',
                  height: 550,
                  width: 550,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 230, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$car_name',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '$car_type',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: const Color.fromRGBO(40, 40, 40, 1)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.network(
                      '$car_brand',
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    color: const Color.fromRGBO(234, 234, 234, 1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  height: 65,
                  width: 65,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.green[800],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '$car_price/Day',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocalCarAd extends StatelessWidget {
  LocalCarAd(
      {super.key,
      required this.car_image,
      required this.car_brand,
      required this.car_price,
      required this.car_name,
      required this.car_type});

  var car_image;
  var car_brand;
  var car_type;
  var car_name;
  var car_price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(195, 195, 195, 1),
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: GestureDetector(
        onTap: () {
          print('Clicked');
        },
        child: Stack(
          children: [
            Positioned(
              right: -250,
              top: -100,
              child: ClipRRect(
                child: Image.asset(
                  '$car_image',
                  height: 550,
                  width: 550,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      '$car_brand',
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    color: const Color.fromRGBO(234, 234, 234, 1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  height: 65,
                  width: 65,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.green[800],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '$car_price/Day',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
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
