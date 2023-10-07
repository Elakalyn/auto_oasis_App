import 'package:auto_oasis/App/Modules/Home/home.dart';
import 'package:auto_oasis/App/Modules/Main/mainModule.dart';
import 'package:auto_oasis/Cubit/carCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../../Cubit/carStates.dart';
import '../../../Shared/Components/components.dart';

class RentVehicle extends StatelessWidget {
  RentVehicle({super.key, required this.vehicleName});

  final vehicleName;

  Widget buildDatePicker(String title, bool isFromDate, context) {
    final String selectedDate = isFromDate
        ? 'From: ${CarCubit.get(context).fromDate.toString()}'
        : 'To: ${CarCubit.get(context).toDate.toString()}';

    return InkWell(
      onTap: () => CarCubit.get(context).selectDate(context, isFromDate),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(selectedDate),
          ],
        ),
      ),
    );
  }

  Widget buildLocationPicker(
      String title, String location, void Function(String) onChanged) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            initialValue: location,
            onChanged: onChanged,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServicesSection(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        const Text(
          'Additional Services',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          children: [
            FilterChip(
              label: const Text('Roadside Assistance'),
              selected: CarCubit.get(context)
                  .selectedServices
                  .contains('Roadside Assistance'),
              onSelected: (isSelected) {
                if (isSelected) {
                  CarCubit.get(context)
                      .selectedServices
                      .add('Roadside Assistance');
                } else {
                  CarCubit.get(context)
                      .selectedServices
                      .remove('Roadside Assistance');
                }
                CarCubit.get(context).addService();
              },
            ),
            FilterChip(
              label: const Text('Child Seat'),
              selected:
                  CarCubit.get(context).selectedServices.contains('Child Seat'),
              onSelected: (isSelected) {
                if (isSelected) {
                  CarCubit.get(context).selectedServices.add('Child Seat');
                } else {
                  CarCubit.get(context).selectedServices.remove('Child Seat');
                }
                CarCubit.get(context).addService();
              },
            ),
            FilterChip(
              label: const Text('Insurance'),
              selected:
                  CarCubit.get(context).selectedServices.contains('Insurance'),
              onSelected: (isSelected) {
                if (isSelected) {
                  CarCubit.get(context).selectedServices.add('Insurance');
                } else {
                  CarCubit.get(context).selectedServices.remove('Insurance');
                }
                CarCubit.get(context).addService();
              },
            ),
            FilterChip(
              label: const Text('Prepaid fuel plan'),
              selected: CarCubit.get(context)
                  .selectedServices
                  .contains('Prepaid fuel plan'),
              onSelected: (isSelected) {
                if (isSelected) {
                  CarCubit.get(context)
                      .selectedServices
                      .add('Prepaid fuel plan');
                } else {
                  CarCubit.get(context)
                      .selectedServices
                      .remove('Prepaid fuel plan');
                }
                CarCubit.get(context).addService();
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildDatePicker('Pickup Date', true, context),
                20.h,
                buildDatePicker('Dropoff Date', false, context),
                20.h,
                buildLocationPicker(
                    'Pickup Location', CarCubit.get(context).pickupLocation,
                    (value) {
                  CarCubit.get(context).pickupLocation = value;
                }),
                20.h,
                buildLocationPicker(
                    'Dropoff Location', CarCubit.get(context).dropoffLocation,
                    (value) {
                  CarCubit.get(context).dropoffLocation = value;
                }),
                20.h,
                buildServicesSection(context),
                20.h,
                FilledButton(
                    onPressed: () {
                      CarCubit.get(context).uploadBookingData(vehicleName);
                      navigateTo(context, RentSuccessful());
                    },
                    style: const ButtonStyle(),
                    child: const Text('Checkout')),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RentSuccessful extends StatelessWidget {
  const RentSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Vehicle booked\n  Successfully!",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            40.h,
            Image.asset('assets/images/2019camry.png'),
            40.h,
            SizedBox(
              height: 48,
              width: 200,
              child: FilledButton(
                child: Text('Home'),
                onPressed: () {
                  navigateTo(context, MainWidget());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
