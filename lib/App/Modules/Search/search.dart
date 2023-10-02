import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import '../../../Cubit/carCuibt.dart';
import '../../../Cubit/carStates.dart';
import '../../../Shared/Components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(children: [
              const searchBar(search: true),
              20.h,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.grey[400]),
              ),
              20.h,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => 20.h,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: CarCubit.get(context).searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    final document = CarCubit.get(context).searchResults[index];
                    // Display the relevant data from the document snapshot

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
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
