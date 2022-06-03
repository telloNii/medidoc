import 'package:doctor_app/text_style.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

OutlineInputBorder textFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: primaryColor.withOpacity(0.1),
  ),
);

const emailError = 'Enter a valid email address';
const requiredField = "This field is required";

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ],
);

// Colors
const primaryColor = Color(0xFF255ED6);
const textColor = Color.fromARGB(255, 5, 5, 5);
const backgroundColor = Color(0xFFE6EFF9);
const redColor = Color(0xFFE85050);
const primaryColor1 = Color(0xFF4FAFFB);
const primaryColor2 = Color(0xFFF1F8FF);
const secondaryColor1 = Color(0xFFFD5646);
const secondaryColor2 = Color(0xFFFFEEEE);

const cardBackgroundColor = Color(0xFFDDECFF);
const discountCardColor = Color(0xFFE5E9EC);
const primaryTextColor = Color(0xFF758086);
const secondaryTextColor = Color(0xFF758086);
const headerTextColor = Color(0xFF151E25);
const subHeaderTextColor = Color(0xFF404D55);
const mainTextColor = Color(0xFF151E25);
const hintTextColor = Color(0xFF636363);
const activeTabColor = Color(0xFFFFFFFF);
const inactiveTabColor = Color(0xFF636363);
const inputTextColor = Color(0xFFFFFFFF);
const buttonTextColor = Color(0xFFFFFFFF);
const searchFieldColor = Color(0xFF121212);
const containerBackgroundColor = Color(0xFF101010);
const favoritedIconColor = Color(0xFFFE4948);
const defaultIconColor = Color(0xFF636363);
const cartBoxColor = Color(0xFFcacaca);

// Heading
const double headline1 = 36;
const double headline2 = 24;
const double headline3 = 20;
const double headline4 = 18;
const double headline5 = 16;
const double headline6 = 14;

//Text
const double tag = 13;
const double tab = 14;
const double buttonLG = 15;
const double buttonSM = 12;
const double input = 13;

//Paragraph
const double paragraph1 = 18;
const double paragraph2 = 16;
const double paragraph3 = 14;
const double paragraph4 = 12;

// font name
const String fontName = "NunitoSans";

// Dimensions
const defaultPadding = 16.0;
const double kSpacingNone = 0.0;
const double kSpacingX2 = 2.0;
const double kSpacingX4 = 4.0;
const double kSpacingX8 = 8.0;
const double kSpacingX12 = 12.0;
const double kSpacingX16 = 16.0;
const double kSpacingX18 = 18.0;
const double kSpacingX20 = 20.0;
const double kSpacingX24 = 24.0;
const double kSpacingX30 = 30.0;
const double kSpacingX36 = 36.0;
const double kSpacingX42 = 42.0;
const double kSpacingX48 = 48.0;
const double kSpacingX56 = 56.0;
const double kSpacingX64 = 64.0;
const double kSpacingX72 = 72.0;
const double kSpacingX84 = 84.0;
const double kSpacingX96 = 96.0;
const double kSpacingX100 = 100.0;
const double kSpacingX120 = 120.0;
const double kSpacingX160 = 160.0;
const double kSpacingX200 = 200.0;
const double kSpacingX230 = 230.0;
const double kSpacingX250 = 250.0;
const double kSpacingX300 = 300.0;
const double kSpacingX320 = 320.0;
const double kSpacingX360 = 360.0;
const double kOpacityX14 = 0.14;
const double kOpacityX35 = 0.35;
const double kOpacityX50 = 0.5;
const double kOpacityX70 = 0.7;
const double kOpacityX90 = 0.9;
const double kEmphasisLow = 0.38;
const double kEmphasisMedium = 0.67;
const double kEmphasisHigh = 0.9;

InputDecoration authTextFieldInputDecoration = InputDecoration(
  hintStyle: inputTextStyle,
  hintText: "Please enter your ",
  fillColor: Colors.grey.withOpacity(0.4),
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.black),
  ),
);
