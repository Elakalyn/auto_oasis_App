// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Cubit/carCuibt.dart';
import '../../../Cubit/carStates.dart';
import '../../../Shared/Components/components.dart';
import '../Main/mainModule.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var usernameController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var phoneNumberController = TextEditingController();
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          navigateToAndFinish(context, const MainWidget());
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.grey[900],
            body: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey[900],
                            size: 40.0,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          width: 80,
                          height: 80,
                          child: Image.asset(
                            "assets/images/onboarding_car.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(children: [
                          TextFormField(
                            controller: usernameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Username cannot be left empty.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: GoogleFonts.robotoCondensed(),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'E-mail cannot be left empty.';
                              } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: GoogleFonts.robotoCondensed(),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password cannot be left empty.';
                              }
                              return null;
                            },
                            obscureText: CarCubit.get(context).isViewable,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.robotoCondensed(),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  CarCubit.get(context).changeViewable();
                                },
                                child: const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: phoneNumberController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field cannnot be left empty.';
                              }
                              if (value.length < 11) {
                                return 'Incorrect phone number format.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: GoogleFonts.robotoCondensed(),
                              prefixIcon: const Icon(
                                Icons.phone_android,
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field cannnot be left empty.';
                              }
                              if (value.toString() != passwordController.text) {
                                return 'Please recheck your password before proceeding.';
                              }
                              return null;
                            },
                            obscureText: CarCubit.get(context).isViewable,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle: GoogleFonts.robotoCondensed(),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  CarCubit.get(context).changeViewable();
                                },
                                child: const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                CarCubit.get(context).register(
                                  phone: phoneNumberController.text,
                                  context: context,
                                  email: emailController.text,
                                  name: usernameController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.blue[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                            ),
                            child: Text(
                              'CREATE YOUR ACCOUNT',
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[900],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ]))
                  ]),
            ));
      },
    );
  }
}
