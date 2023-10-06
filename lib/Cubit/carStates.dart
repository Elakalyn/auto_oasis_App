import 'package:flutter/material.dart';

@immutable
abstract class CarState {}

class CarInitial extends CarState {}

class SuffixChangeState extends CarState {}

class BNBChangeState extends CarState {}

// LOGIN STATES
class LoadingLoginState extends CarState {}

class ErrorLoginState extends CarState {}

class SuccessLoginState extends CarState {}

// REGISTER STATES
class LoadingRegisterState extends CarState {}

class ErrorRegisterState extends CarState {}

class SuccessRegisterState extends CarState {}

// SETTINGS

class ChangedSettingsState extends CarState {}

class ScrollExpansionState extends CarState {}

class ThemeChangeState extends CarState {}

// OTHERS

class Filtering extends CarState {}

class LoadDescription extends CarState {}

// Search

class StartSearchState extends CarState {}

class SearchLoadingState extends CarState {}

class SearchSuccessState extends CarState {}

class SearchErrorState extends CarState {}
