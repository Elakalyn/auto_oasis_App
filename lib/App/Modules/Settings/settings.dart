// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unused_import

import 'package:auto_oasis/App/Modules/Login/login.dart';
import 'package:auto_oasis/Cubit/carStates.dart';
import 'package:auto_oasis/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import '../../../Cubit/carCubit.dart';
import '../../../Network/Local/cacheHelper.dart';
import '../../../Shared/Constants/constants.dart';
import '../../../Widget Construction/widget_construction.dart';
import '../../../main.dart';
import '../Profile/profile.dart';
import '../Vehicles/vehicles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CarCubit, CarState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          return const SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    searchBar(settings: true),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 15,
                        runSpacing: 15,
                        children: [
                          settingWidget(
                              image: 'assets/Icons/profile.png',
                              name: 'Account'),
                          settingWidget(
                              image: 'assets/Icons/profile.png',
                              name: 'Payment'),
                          settingWidget(
                              image: 'assets/Icons/profile.png',
                              name: 'Language'),
                          settingWidget(
                              image: 'assets/Icons/profile.png',
                              name: 'Rent History'),
                          settingWidget(
                              image: 'assets/Icons/profile.png',
                              name: 'Appearance'),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}


class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

class RentHistory extends StatelessWidget {
  const RentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

class Appearance extends StatelessWidget {
  const Appearance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.maxFinite,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        const Text('Dark theme',
                            style: TextStyle(
                              fontSize: 24,
                            )),
                        const Spacer(),
                        Switch(
                            value: darkTheme,
                            onChanged: (v) {
                              CarCubit.get(context).changeTheme(v);
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
