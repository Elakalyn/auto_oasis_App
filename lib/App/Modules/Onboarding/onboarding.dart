import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Cubit/carCuibt.dart';
import '../../../Cubit/carStates.dart';
import '../../../Network/Local/cacheHelper.dart';
import '../../../Shared/Components/components.dart';
import '../Login/login.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[900],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        width: 300,
                        height: 300,
                        child: Image.asset(
                          "assets/images/onboarding_car.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              bigText(
                context: context,
                color: Colors.white,
                weight: FontWeight.bold,
                text: 'Your ride, your way',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We put you in control, with flexible pick-up and drop-off locations, customizable rental periods, and a variety of vehicle options to choose from. You can create a rental experience that meets your unique needs and preferences.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                  onPressed: () async {
                    await CacheHelper.saveData(
                            key: 'displayOnBoarding', value: false)
                        .then((value) {
                      print('Onboarding page displayed.');
                      navigateToAndFinish(context, Login());
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white, // button border color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // rounded corners
                    ),
                    side: const BorderSide(
                        color: Colors.white, width: 1), // button border
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 14), // button padding
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
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
