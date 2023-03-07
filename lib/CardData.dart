import 'package:flutter/material.dart';

class CardData {
  late String title;
  late IconData icon;
  String value;
  CardData({required this.icon, required this.title, required this.value});
}

List<CardData> cardInfo = [
  CardData(icon: Icons.fastfood, title: 'Calories', value: '245'),
  CardData(icon: Icons.hotel, title: 'Sleep', value: '85'),
  CardData(icon: Icons.hotel, title: 'Sleep', value: '85'),
  CardData(icon: Icons.hotel, title: 'Sleep', value: '85'),
];

