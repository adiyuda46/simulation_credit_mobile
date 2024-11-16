import 'package:flutter/material.dart';

class CategoryMotorBaruResp {
  final List<String> category;
  final String message;

  CategoryMotorBaruResp({required this.category, required this.message});

  factory CategoryMotorBaruResp.fromJson(Map<String, dynamic> json) {
    return CategoryMotorBaruResp(
      category: List<String>.from(json['data']['category']),
      message: json['data']['message'],
    );
  }
}

class VarianMotorBaruResp {
  final List<String> varian;
  final String message;

  factory VarianMotorBaruResp.fromJson(Map<String, dynamic> json) {
    return VarianMotorBaruResp(
      message: json['data']['message'],
      varian: List<String>.from(json['data']['varian']),
    );
  }

  VarianMotorBaruResp({required this.varian, required this.message});
}

class PriceMotorBaruResp {
  final String message;
  final String price;

  PriceMotorBaruResp({required this.message, required this.price});

  factory PriceMotorBaruResp.fromJson(Map<String, dynamic> json) {
  final data = json['data'];
  return PriceMotorBaruResp(
    message: data['message'], 
    price: data['priceProduct'], 
  );
}
}
