import 'package:auto_oasis/Cubit/carStates.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Cubit/carCuibt.dart';
import '../Home/home.dart';

class VehiclesPage extends StatelessWidget {
  const VehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<Widget> popularBrands = [
          const brandWidget(brand_image: 'assets/images/Nissan_logo.png'),
          const brandWidget(brand_image: 'assets/images/tesla_logo.png'),
          const brandWidget(brand_image: 'assets/images/Hyundai-Logo.png'),
          const brandWidget(brand_image: 'assets/images/citroen_logo.png'),
          const brandWidget(brand_image: 'assets/images/toyota_logo.png'),
        ];

        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
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
                        icon: Image.asset('assets/images/onboarding_car.png'),
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
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/star.png',
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Popular Brands',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: SizedBox(
                    height: 70,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularBrands.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 18,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return popularBrands[index];
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/liked.png',
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Top Rated',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                CarouselSlider(
                  items: [
                    LocalCarAd(
                      car_brand: 'assets/images/Nissan_logo.png',
                      car_image: 'assets/images/nissan_navara.png',
                      car_name: 'Nissan Navara',
                      car_price: '120/Day',
                      car_type: 'SUV',
                    ),
                    LocalCarAd(
                      car_brand: 'assets/images/toyota_logo.png',
                      car_image: 'assets/images/2019camry.png',
                      car_name: 'Toyota Camry',
                      car_price: '170/Day',
                      car_type: 'Sedan',
                    ),
                    LocalCarAd(
                      car_brand: 'assets/images/tesla_logo.png',
                      car_image: 'assets/images/model_Y.png',
                      car_name: 'Tesla Model Y',
                      car_price: '230/Day',
                      car_type: 'Sedan',
                    ),
                  ],
                  options: CarouselOptions(autoPlay: true, viewportFraction: 1),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/fire.png',
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Hot Deals',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                SizedBox(
                  height: 1400, // specify a fixed height
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LocalCarAd(
                          car_brand: 'assets/images/Nissan_logo.png',
                          car_image: 'assets/images/nissan_navara.png',
                          car_name: 'Nissan Navara',
                          car_price: '120/Day',
                          car_type: 'SUV',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}

class brandWidget extends StatelessWidget {
  const brandWidget({
    super.key,
    required this.brand_image,
  });

  final brand_image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          '$brand_image',
          width: 60,
          height: 60,
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(18),
          color: const Color.fromRGBO(234, 234, 234, 1)),
    );
  }
}
