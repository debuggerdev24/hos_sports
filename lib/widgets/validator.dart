import 'package:flutter/material.dart';

bool validateEmail(String email) {
  // Regular expression for email validation
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false, multiLine: false);

  // Check if the provided email matches the regular expression
  return emailRegex.hasMatch(email);
}

bool validatePhoneNumber(String phoneNumber) {
  // Regular expression for phone number validation
  final RegExp phoneRegex = RegExp(
    r'^[0-9]{8,}$', // Matches phone numbers with at least 8 digits
    caseSensitive: false,
    multiLine: false,
  );

  // Check if the provided phone number matches the regular expression
  return phoneRegex.hasMatch(phoneNumber);
}

bool validateOtp(String otp) {
  // Regular expression for phone number validation
  final RegExp phoneRegex = RegExp(
    r'^[0-9]{4,}$',
    caseSensitive: false,
    multiLine: false,
  );

  // Check if the provided phone number matches the regular expression
  return phoneRegex.hasMatch(otp);
}

bool validatePassword(String password) {
  // Regular expression for password validation
  final RegExp passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:<>?]).{8,}$',
    caseSensitive: false,
    multiLine: false,
  );

  // Check if the provided password matches the regular expression
  return passwordRegex.hasMatch(password);
}

bool isTimeOfDayInThePast(TimeOfDay selectedTime) {
  final now = TimeOfDay.now();
  final currentMinutes = now.hour * 60 + now.minute;
  final selectedMinutes = selectedTime.hour * 60 + selectedTime.minute;
  return selectedMinutes <= currentMinutes;
}
