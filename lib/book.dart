import 'package:layout/book.dart';
import 'package:flutter/material.dart';

class Book {
  final String title;
  final double price;
  final String image;
  final String description;

  Book({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
  });
}
