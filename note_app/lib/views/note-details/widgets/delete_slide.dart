import 'package:flutter/material.dart';

Container deleteSlide() {
  return Container(
    color: Colors.red,
    child: const Center(
      child: Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    ),
  );
}
