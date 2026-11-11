import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  // Light Theme
  static final InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
        errorMaxLines: 3,
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
        hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
        errorStyle: const TextStyle(fontStyle: FontStyle.normal),
        floatingLabelStyle: TextStyle(
          color: Colors.black.withValues(alpha: 0.8),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(width: 1, color:Color.fromARGB(255, 24, 3, 1)),
        ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(3),
        //   borderSide: const BorderSide(width: 1, color: Color.fromARGB(255, 11, 4, 3)),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(3),
        //   borderSide: const BorderSide(width: 2, color: Colors.orange),
        // ),
      );

  // Dark Theme
  static final InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
        errorMaxLines: 3,
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        labelStyle: const TextStyle(fontSize: 14, color: Colors.white),
        hintStyle: const TextStyle(fontSize: 14, color: Colors.white70),
        errorStyle: const TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.redAccent,
        ),
        floatingLabelStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.8),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(width: 1, color: Colors.white70),
        ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(14),
        //   borderSide: const BorderSide(width: 1, color: Colors.redAccent),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(14),
        //   borderSide: const BorderSide(width: 2, color: Colors.orange),
        // ),
      );
}
