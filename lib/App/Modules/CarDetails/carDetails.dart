import 'package:auto_oasis/Cubit/carCubit.dart';
import 'package:auto_oasis/Cubit/carStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../../Shared/Components/components.dart';
import '../Rent/rent.dart';

class CarDetails extends StatelessWidget {
  const CarDetails(
      {super.key,
      required this.car_image,
      required this.car_brand,
      required this.car_name,
      required this.brand_name});

  final car_name;
  final car_image;
  final car_brand;
  final brand_name;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Image.network(car_image),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Chip(
                            avatar: Image.network(car_brand),
                            label: Text(
                              brand_name,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 30,
                                    height: 30,
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
                          )
                        ],
                      ),
                    ),
                    20.h,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            car_name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 77,
                            height: 4,
                            padding: const EdgeInsets.only(right: 19.25),
                            clipBehavior: Clip.antiAlias,
                            decoration:
                                const BoxDecoration(color: Color(0xFFE6E0E9)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 57.75,
                                  height: 4,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF6750A4)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.h,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: 376,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'C4 is an energetic and assertive attitude: A tall, sculpted hood, A front end which incorporates the...',
                          ),
                        ),
                      ),
                    ),
                    40.h,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'Features',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 155,
                            height: 37,
                            child: FilledButton(
                                onPressed: () {},
                                style: const ButtonStyle(),
                                child: const Text('Compare')),
                          ),
                        ],
                      ),
                    ),
                    20.h,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      child: Wrap(
                        spacing: 4,
                        children: [
                          Chip(
                            label: Text(
                              'Air Conditioner',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Chip(
                            label: Text(
                              'FM/AM Radio',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Chip(
                            label: Text(
                              'Bluetooth',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Chip(
                            label: Text(
                              'USB Charger',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Chip(
                            label: Text(
                              'Airbag',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Chip(
                            label: Text(
                              'Touch Screen',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.h,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'Transmission',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.h,
                    const Wrap(
                      spacing: 4,
                      children: [
                        Chip(
                          label: Text(
                            'Automatic',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                        Chip(
                          label: Text(
                            'Manual',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    90.h,
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: FilledButton(
                        onPressed: () {
                          navigateTo(
                              context, RentVehicle(vehicleName: car_name));
                        },
                        style: const ButtonStyle(),
                        child: const Text('Rent')),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
