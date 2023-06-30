// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Cubit/carCuibt.dart';
import '../../../Cubit/carStates.dart';
import '../../../Shared/Components/components.dart';
import '../Home/home.dart';
import '../Main/mainModule.dart';
import '../Register/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    bool fieldStatus = true;
    Widget suffixWidgetPassword = const Icon(
      Icons.visibility,
      color: Colors.white,
    );

    Widget? suffixWidgetEmail = null;

    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {
        print(state);
        if (state is LoadingLoginState) {
          fieldStatus = false;
          suffixWidgetEmail = const CircularProgressIndicator(
            color: Colors.white38,
            strokeWidth: 1,
          );
          suffixWidgetPassword = const CircularProgressIndicator(
            color: Colors.white38,
            strokeWidth: 1,
          );
        } else {
          fieldStatus = true;
          suffixWidgetEmail = null;
          suffixWidgetPassword = const Icon(
            Icons.visibility,
            color: Colors.white,
          );
        }

        if (state is SuccessLoginState) {
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
                            Icons.lock,
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
                            controller: emailController,
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
                            decoration: InputDecoration(
                              hintText: 'Email',
                              suffixIcon: suffixWidgetEmail,
                              enabled: fieldStatus,
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
                              enabled: fieldStatus,
                              hintStyle: GoogleFonts.robotoCondensed(),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  CarCubit.get(context).changeViewable();
                                },
                                child: suffixWidgetPassword,
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
                                CarCubit.get(context)
                                    .loginUser(emailController.text,
                                        passwordController.text, context)
                                    .then((value) {});
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
                              'LOGIN',
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[900],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              TextButton(
                                child: Text(
                                  'REGISTER NOW',
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: () {
                                  navigateTo(context, Register());
                                },
                              ),
                            ],
                          ),
                        ]))
                  ]),
            ));
      },
    );
  }
}
