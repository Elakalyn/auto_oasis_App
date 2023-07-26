// ignore_for_file: unused_import

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
      home = MainWidget();
    } else {
      home = Login();
    }
    return BlocProvider(
      create: (context) => CarCubit()..loadUserData(),
      child: BlocConsumer<CarCubit, CarState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Auto Oasis',
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: MainWidget(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Image.asset('assets/images/onboarding_car.png'),
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
