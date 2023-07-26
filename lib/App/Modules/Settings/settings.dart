// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unused_import

import 'package:auto_oasis/App/Modules/Login/login.dart';
import 'package:auto_oasis/Cubit/carStates.dart';
import 'package:auto_oasis/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Cubit/carCuibt.dart';
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
    var themes = ['Light', 'Dark'];
    var languages = ['English', 'Spanish', 'French'];
    var selectedLanguage = 'English';

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<CarCubit, CarState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    searchBar(settings: true),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                              name: 'Provide Feedback'),
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
