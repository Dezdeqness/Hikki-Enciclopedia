import 'package:flutter/material.dart';

abstract class AppStyles {
  static const TextStyle newsItemTitle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 16,
  );

  static const TextStyle newsItemDescription = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  static const TextStyle categoryItemText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle headerText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static const TextStyle promotionalText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 1.1,
  );

  static const TextStyle headerActionButton = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const TextStyle animeTypeLabel = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 1.1,
  );

  static const TextStyle animeTitle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 1.1,
  );

  static const TextStyle animeScore = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 1.1,
  );
}
