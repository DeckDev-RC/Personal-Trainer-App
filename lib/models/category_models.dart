import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Braços',
        iconPath: 'assets/icons/arm.png',
        boxColor: Colors.grey.shade300,
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Pernas',
        iconPath: 'assets/icons/perna.png',
        boxColor: Colors.grey.shade300,
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Abdomen',
        iconPath: 'assets/icons/abdomen.png',
        boxColor: Colors.grey.shade300,
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Costas',
        iconPath: 'assets/icons/costas.png',
        boxColor: Colors.grey.shade300,
      ),
    );

    return categories;
  }
}
