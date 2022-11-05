import 'package:flutter/material.dart';

AppBar appBar(String appbar) {
    return AppBar(
      // toolbarHeight: 100,
      title: Center(
          child: Text(
        appbar,
        style: const TextStyle(color: Colors.white),
      )),
      backgroundColor: const Color(0xffff6f00),
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80)),
      ),
    );
  }