// ignore_for_file: unused_import

import 'package:auto_oasis/App/Modules/Home/home.dart';
import 'package:auto_oasis/App/Modules/Settings/settings.dart';
import 'package:auto_oasis/App/Modules/Vehicles/vehicles.dart';
import 'package:auto_oasis/Network/Local/cacheHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/Constants/constants.dart';
import 'carStates.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit() : super(CarInitial());
  static CarCubit get(context) => BlocProvider.of(context);

  bool isViewable = false;
  void changeViewable() {
    if (isViewable == true) {
      isViewable = false;
    } else if (isViewable == false) {
      isViewable = true;
    }
    print(isViewable);

    emit(SuffixChangeState());
  }

  int indexs = 0;

  void changeIndex(index) {
    indexs = index;
    emit(BNBChangeState());
  }

  List<Widget> Screens = [
    HomePage(),
    CarsPage(),
    SettingsPage(),
  ];

  Future<Object?> register(
      {required String email,
      required String password,
      required context,
      required String phone,
      required String name}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      emit(LoadingRegisterState());
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        print(value.user?.uid);
        // CREATION OF USER-------------

        FirebaseFirestore.instance
            .collection('users')
            .doc(value.user?.uid)
            .set({
          'name': name,
          'email': email,
          'profile_image':
              'https://firebasestorage.googleapis.com/v0/b/car-app-410f4.appspot.com/o/vehicles_Icon.png?alt=media&token=0994d376-c08d-477d-aa48-f3290b0dc85d',
          'uid': value.user?.uid,
          'phone': phone,
        });
        await CacheHelper.saveData(key: 'uid', value: value.user?.uid);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Account created successfully!",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
        emit(SuccessRegisterState());
        return value;
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      emit(ErrorRegisterState());
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("The password provided is too weak.",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("The account already exists for that email.",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<UserCredential?> loginUser(
    String email,
    String password,
    context,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      emit(LoadingLoginState());
      UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        print(value.user?.uid);
        await CacheHelper.saveData(key: 'uid', value: value.user?.uid);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content:
              Text("Login Success!", style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
        emit(SuccessLoginState());

        return value;
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      emit(ErrorLoginState());
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content:
              Text("User not found.", style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Wrong password provided for that user.",
              style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
        ));
      }
      return null;
    }
  }

  Future<dynamic> loadUserData() async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    interuser = documentSnapshot;
  }

  void selectFeature() {
    emit(Filtering());
  }

  void loadDescription() {
    emit(LoadDescription());
  }

  // SETTINGS PAGE
}
