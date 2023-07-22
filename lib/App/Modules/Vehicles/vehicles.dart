// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names

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
    var selected = false;
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
              height: 20,
            ),
            Row(
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
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: double.maxFinite,
                          height: 400,
                          child: Column(
                            children: [
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
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
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
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Wrap(
                                  spacing: 4,
                                  runSpacing: 2,
                                  children: [
                                    ActionChip(
                                      backgroundColor: selected
                                          ? const Color(0xFF6750A4)
                                          : const Color.fromRGBO(
                                              232, 232, 232, 1),
                                      avatar: selected
                                          ? const Icon(Icons.remove,
                                              color: Colors.white)
                                          : const Icon(Icons.add),
                                      label: Text(
                                        'Air Conditioner',
                                        style: TextStyle(
                                            color: selected
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      onPressed: () {
                                        if (selected == true) {
                                          selected = false;
                                        } else {
                                          selected = true;
                                        }
                                        CarCubit.get(context).selectFeature();
                                      },
                                    ),
                                    /*           ActionChip(
                                      backgroundColor: selected
                                          ? Color(0xFF6750A4)
                                          : Color.fromRGBO(232, 232, 232, 1),
                                      avatar: selected
                                          ? Icon(Icons.remove,
                                              color: Colors.white)
                                          : Icon(Icons.add),
                                      label: Text(
                                        'FM/AM Radio',
                                        style: TextStyle(
                                            color: selected
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      onPressed: () {
                                        if (selected == true) {
                                          selected = false;
                                        } else {
                                          selected = true;
                                        }
                                        CarCubit.get(context).selectFeature();
                                      },
                                    ),
                                    ActionChip(
                                      backgroundColor: selected
                                          ? Color(0xFF6750A4)
                                          : Color.fromRGBO(232, 232, 232, 1),
                                      avatar: selected
                                          ? Icon(Icons.remove,
                                              color: Colors.white)
                                          : Icon(Icons.add),
                                      label: Text(
                                        'Bluetooth',
                                        style: TextStyle(
                                            color: selected
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      onPressed: () {
                                        if (selected == true) {
                                          selected = false;
                                        } else {
                                          selected = true;
                                        }
                                        CarCubit.get(context).selectFeature();
                                      },
                                    ),
                                    ActionChip(
                                      backgroundColor: selected
                                          ? Color(0xFF6750A4)
                                          : Color.fromRGBO(232, 232, 232, 1),
                                      avatar: selected
                                          ? Icon(Icons.remove,
                                              color: Colors.white)
                                          : Icon(Icons.add),
                                      label: Text(
                                        'USB Charger',
                                        style: TextStyle(
                                            color: selected
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      onPressed: () {
                                        if (selected == true) {
                                          selected = false;
                                        } else {
                                          selected = true;
                                        }
                                        CarCubit.get(context).selectFeature();
                                      },
                                    ),
                                    ActionChip(
                                      backgroundColor: selected
                                          ? Color(0xFF6750A4)
                                          : Color.fromRGBO(232, 232, 232, 1),
                                      avatar: selected
                                          ? Icon(Icons.remove,
                                              color: Colors.white)
                                          : Icon(Icons.add),
                                      label: Text(
                                        'Airbag',
                                        style: TextStyle(
                                            color: selected
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      onPressed: () {
                                        if (selected == true) {
                                          selected = false;
                                        } else {
                                          selected = true;
                                        }
                                        CarCubit.get(context).selectFeature();
                                      },
                                    ),
                                    ActionChip(
                                      backgroundColor: selected
                                          ? Color(0xFF6750A4)
                                          : Color.fromRGBO(232, 232, 232, 1),
                                      avatar: selected
                                          ? Icon(Icons.remove,
                                              color: Colors.white)
                                          : Icon(Icons.add),
                                      label: Text(
                                        'Touch Screen',
                                        style: TextStyle(
                                            color: selected
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      onPressed: () {
                                        if (selected == true) {
                                          selected = false;
                                        } else {
                                          selected = true;
                                        }
                                        CarCubit.get(context).selectFeature();
                                      },
                                    ),
                               */
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
                  car_year: '2017'),
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
                          car_type: document['vehicle_type']);
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
    return InkWell(
      onHover: (val) {},
      onTap: () {
        navigateTo(context, const CarDetails());
      },
      child: Container(
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
