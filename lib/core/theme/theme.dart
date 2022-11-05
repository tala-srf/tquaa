import 'package:flutter/material.dart';



final theme = ThemeData(
  
  primaryColor: const Color(0xffff6f00),
  primaryColorLight: const Color(0xffff6f00),
elevatedButtonTheme: ElevatedButtonThemeData(
   style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
          backgroundColor: MaterialStateProperty.all(const Color(0xffff6f00)),
          minimumSize: const MaterialStatePropertyAll(Size(300, 60)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          side: MaterialStateProperty.all(
              const BorderSide(color: Color(0xffff6f00), width: 1.5)),
        ),
)

);
