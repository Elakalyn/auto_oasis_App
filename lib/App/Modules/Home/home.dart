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
          child: Column(children: [
            Container(
              height: 90,
              padding: const EdgeInsets.only(top: 34, left: 15, right: 15),
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
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                  label: Text('Budget'),
                ),
                const SizedBox(
                  width: 13,
                ),
                Chip(label: Text('Comfort')),
                const SizedBox(
                  width: 13,
                ),
                Chip(label: Text('Luxury')),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Filter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              width: 300,
              color: Color(0xFFCAC4D0),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Most popular',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 34,
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
                  car_year: '2017'),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Top matches',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 34,
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
                  /*      if (snapshot.hasError) {
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
*/
                  return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 10,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1 /* querySnapshot.docs.length */,
                    itemBuilder: (BuildContext context, int index) {
                      /*  final DocumentSnapshot<Object?> document =
                                querySnapshot.docs[index]; */

                      /*  
                                CarAd(
                                car_image: document['vehicle_image'],
                                car_brand: document['brand_image'],
                                car_price: document['vehicle_price'],
                                car_year: document['year'],
                                car_name: document['vehicle_name'],
                                car_type: document['vehicle_type']);
                                */
                      return mockAds[index];
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

List<CarAd> mockAds = [
  CarAd(
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
      width: 360,
      height: 115,
      child: Row(
        children: [
          Container(
            width: 155,
            height: 115,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://media.discordapp.net/attachments/673875945198714920/1132035875476340816/citroen_cactus.webp?width=781&height=610'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Spacer(),
          Column(
            children: [
              Text(
                'Citroen Cactus',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23.34,
                ),
              ),
              Spacer(),
              SizedBox(
                width: 155,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '50\$/Day',
                    style: TextStyle(
                      color: Color(0xFF188D1D),
                      fontSize: 13.41,
                    ),
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 155,
                child: FilledButton(
                    onPressed: () {},
                    child: Text('Rent'),
                    style: ButtonStyle()),
              ),
            ],
          ),
        ],
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
