import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final String movietime;
  final String imageUrl;
  final String numberofseats;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.movietime,
    @required this.imageUrl,
    @required this.numberofseats,

  });
}