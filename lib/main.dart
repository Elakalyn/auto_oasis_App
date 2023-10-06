// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:auto_oasis/App/Modules/Main/mainModule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'App/Modules/Login/login.dart';
import 'App/Modules/Onboarding/onboarding.dart';

import 'App/Modules/Profile/profile.dart';
import 'Cubit/carCuibt.dart';
import 'Cubit/carStates.dart';
import 'Network/Local/cacheHelper.dart';
import 'Shared/Constants/constants.dart';
import 'Shared/Styles/styles.dart';
import 'Widget Construction/widget_construction.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var onbCache = await CacheHelper.getData(key: 'displayOnBoarding');
  displayOnBoarding = onbCache;

  var darkThemeCache = await CacheHelper.getData(key: 'darkTheme');
  darkTheme = darkThemeCache;
  // await CacheHelper.removeData(key: 'displayOnBoarding');
  /* Map<String, dynamic> carData = {
    'vehicle_brand': 'KIA',
    'vehicle_image':
        'https://firebasestorage.googleapis.com/v0/b/car-app-410f4.appspot.com/o/2019-kia-rio-s-sedan-angular-front.webp?alt=media&token=5f57d3ec-1e3b-4548-b4bc-905efbb8fa20',
    'vehicle_name': 'Kia Rio',
    'vehicle_price': '125',
    'vehicle_type': 'Sedan',
    'brand_image':
        'https://firebasestorage.googleapis.com/v0/b/car-app-410f4.appspot.com/o/Kia-logo.png?alt=media&token=a081a121-e1f7-42cd-bcf8-8837cf33dc85',
  };

  await FirebaseFirestore.instance
      .collection('vehicles')
      .add(carData)
      .then((value) {
    print(value.id);
  });  */ // FOR ADDING MORE VEHICLES TO THE DATA BASE

  runApp(const MyApp());
}

var displayOnBoarding;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget home;
    if (displayOnBoarding == null) {
      home = const onboarding();
    } else if (uid != null) {
      home = const MainWidget();
    } else {
      home = const Login();
    }
    return BlocProvider(
      create: (context) => CarCubit()..loadUserData(),
      child: BlocConsumer<CarCubit, CarState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Auto Oasis',
            theme: ThemeData(
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.orange,
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.black,
                    displayColor: Colors.black,
                  ),
            ),
            themeMode: darkTheme ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.grey[800],
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey[800],
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.orange,
              ),
              primaryColor: Colors.orange,
              useMaterial3: true,
              filledButtonTheme: const FilledButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                  Colors.orange,
                )),
              ),
              scaffoldBackgroundColor: Colors.grey[800],
              textTheme: Theme.of(context).textTheme.apply(
                    //  Set default Text() color;  Use:  apply()
                    bodyColor: Colors.white,
                    displayColor: Colors.white,
                  ),
            ),
            home: const MainWidget(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

void batchUpdateDocuments() async {
  final batch = FirebaseFirestore.instance.batch();

  // Get all documents
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('vehicles').get();

  // Loop through document
  // s
  for (DocumentSnapshot doc in querySnapshot.docs) {
    batch.update(
      doc.reference,
      {'description': ''},
    );
  }

  // Commit batch write
  await batch.commit();
}
