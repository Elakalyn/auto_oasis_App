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
import '../../../main.dart';
import '../Profile/profile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var themes = ['Light', 'Dark'];
    var languages = ['English', 'Spanish', 'French'];
    var selectedLanguage = 'English';

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BlocConsumer<CarCubit, CarState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          if (selectedTheme == null) {
            selectedTheme = 0;
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              const SizedBox(height: 42.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'General',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(height: 1.0),
                      ListTile(
                        title: const Text('Notifications'),
                        trailing: Switch(
                          value: switchvalue ??= true,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            CacheHelper.saveData(
                                key: 'enableNotifications', value: value);
                            print(CacheHelper.getData(
                              key: 'enableNotifications',
                            ));
                            switchvalue = value;
                            CarCubit.get(context).emit(ChangedSettingsState());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Appearance',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(height: 1.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Theme',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Wrap(
                              spacing: 8.0,
                              children: themes
                                  .asMap()
                                  .entries
                                  .map(
                                    (entry) => GestureDetector(
                                      onTap: () {
                                        if (selectedTheme == 0) {
                                          CacheHelper.saveData(
                                              key: 'Theme', value: 1);
                                          selectedTheme = 1;
                                          CarCubit.get(context)
                                              .emit(ChangedSettingsState());
                                        } else if (selectedTheme == 1) {
                                          CacheHelper.saveData(
                                              key: 'Theme', value: 0);
                                          selectedTheme = 0;
                                          CarCubit.get(context)
                                              .emit(ChangedSettingsState());
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: selectedTheme == entry.key
                                              ? Colors.blue
                                              : Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 8.0,
                                        ),
                                        child: Text(
                                          entry.value,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(height: 1.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DropdownButtonFormField<String>(
                          value: selectedLanguage,
                          onChanged: (v) {},
                          items: languages.map((language) {
                            return DropdownMenuItem<String>(
                              value: language,
                              child: Text(language),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(height: 1.0),
                      ListTile(
                        title: const Text('Profile'),
                        leading: Image.asset(
                          'assets/Icons/profile.png',
                          width: 24,
                          height: 24,
                        ),
                        onTap: () {
                          navigateTo(context, UserProfile());
                        },
                      ),
                      ListTile(
                        title: const Text('Security'),
                        leading: Image.asset(
                          'assets/Icons/security_Icon.png',
                          width: 28,
                          height: 28,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Rent History'),
                        leading: Icon(Icons.history),
                        onTap: () {},
                      ),
                      ListTile(
                          title: const Text('Sign out'),
                          leading: Image.asset(
                            'assets/Icons/signout_Icon.png',
                            width: 24,
                            height: 24,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Log out',
                                    style: GoogleFonts.inter(),
                                  ),
                                  content: Text(
                                    'Are you sure you want to log out?',
                                    style: GoogleFonts.inter(),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Dismiss the dialog and return false
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: GoogleFonts.inter(),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        CacheHelper.removeData(key: 'uid')
                                            .then((value) {
                                          navigateToAndFinish(context, Login());
                                        });
                                      },
                                      child: Text(
                                        'Log out',
                                        style: GoogleFonts.inter(),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
