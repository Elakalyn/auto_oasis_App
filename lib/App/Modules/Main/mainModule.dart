import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Cubit/carCubit.dart';
import '../../../Cubit/carStates.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: CarCubit.get(context).Screens[CarCubit.get(context).indexs],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
                selectedItemColor: Colors.black,
                currentIndex: CarCubit.get(context).indexs,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  CarCubit.get(context).changeIndex(index);
                },
                selectedLabelStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                ),
                items: [
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/Icons/home_Icon.png',
                        width: 32,
                        height: 32,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/Icons/vehicles_Icon.png',
                        width: 32,
                        height: 32,
                      ),
                      label: 'Vehicles'),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/Icons/settings_Icon.png',
                        width: 32,
                        height: 32,
                      ),
                      label: 'Settings'),
                ]),
          ),
        );
      },
    );
  }
}
