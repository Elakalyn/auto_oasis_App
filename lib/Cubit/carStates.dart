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
