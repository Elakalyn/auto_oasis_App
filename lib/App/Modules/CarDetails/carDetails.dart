import 'package:auto_oasis/Cubit/carCuibt.dart';
import 'package:auto_oasis/Cubit/carStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Widget description = const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text:
                'Citroën C4 is an energetic and assertive attitude: A tall, sculpted hood, A front end which incorporates the ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.75,
              fontWeight: FontWeight.w300,
            ),
          ),
          TextSpan(
            text: 'Read more',
            style: TextStyle(
              color: Color(0xFF3366CC),
              fontSize: 12,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );

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
                      child: Image.asset('assets/images/2019camry.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Chip(
                            avatar:
                                Image.asset('assets/images/toyota_logo.png'),
                            label: const Text(
                              'Toyota',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '4.5',
                            style: TextStyle(
                              color: Colors.black,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'Citroen Cactus',
                            style: TextStyle(
                              color: Colors.black,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: 376,
                        child: InkWell(
                          onTap: () {
                            if (description ==
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text:
                                        'Citroën C4 is an energetic and assertive attitude: A tall, sculpted hood, A front end which incorporates the new aesthetic codes of Citroën: V-shaped light signature, double-stage headlamps and chrome chevrons stretched across the entire width of the vehicle, A staging that highlights Citroën 100% LED Vision technology on the daytime running lights, headlamps and fog lights.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.75,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Read less',
                                    style: TextStyle(
                                      color: Color(0xFF3366CC),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                ]))) {
                              description = Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Citroën C4 is an energetic and assertive attitude: A tall, sculpted hood, A front end which incorporates the ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.75,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Read more',
                                      style: TextStyle(
                                        color: Color(0xFF3366CC),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              CarCubit.get(context).loadDescription();
                            } else {
                              description = Text.rich(TextSpan(children: [
                                TextSpan(
                                  text:
                                      'Citroën C4 is an energetic and assertive attitude: A tall, sculpted hood, A front end which incorporates the new aesthetic codes of Citroën: V-shaped light signature, double-stage headlamps and chrome chevrons stretched across the entire width of the vehicle, A staging that highlights Citroën 100% LED Vision technology on the daytime running lights, headlamps and fog lights.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.75,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Read less',
                                  style: TextStyle(
                                    color: Color(0xFF3366CC),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              ]));
                            }
                            CarCubit.get(context).loadDescription();
                          },
                          child: description,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'Features',
                            style: TextStyle(
                              color: Colors.black,
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
                                child: const Text('Compare'),
                                style: const ButtonStyle()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Wrap(
                        spacing: 4,
                        children: [
                          Chip(
                            label: const Text(
                              'Air Conditioner',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Chip(
                            label: const Text(
                              'FM/AM Radio',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Chip(
                            label: const Text(
                              'Bluetooth',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Chip(
                            label: const Text(
                              'USB Charger',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Chip(
                            label: const Text(
                              'Airbag',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Chip(
                            label: const Text(
                              'Touch Screen',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'Transmission',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 4,
                      children: [
                        Chip(
                          label: const Text(
                            'Automatic',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                        Chip(
                          label: const Text(
                            'Manual',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                    ),
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
                        onPressed: () {},
                        child: const Text('Rent'),
                        style: const ButtonStyle()),
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
