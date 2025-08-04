import 'package:flutter/material.dart';

class PackageModel {
  final String bonusText;
  final int originalAmount;
  final int totalAmount;
  final String price;
  final Gradient gradient;

  const PackageModel({required this.bonusText, required this.originalAmount, required this.totalAmount, required this.price, required this.gradient});
}
