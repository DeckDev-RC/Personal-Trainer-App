import 'package:flutter/material.dart';

class TipsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;
  Color boxColor;

  TipsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
    required this.boxColor,
  });

  static List<TipsModel> getTips() {
    List<TipsModel> tips = [];

    tips.add(
      TipsModel(
        name: 'Treino de Musculação',
        iconPath: 'assets/icons/musculacao.png',
        level: 'Intermediário',
        duration: '1hr 30min',
        calorie: '300kcal',
        boxIsSelected: true,
        boxColor: Colors.blue.shade300,
      ),
    );

    tips.add(
      TipsModel(
        name: 'Treino de Cardio',
        iconPath: 'assets/icons/cardio.png',
        level: 'Avançado',
        duration: '45min',
        calorie: '400kcal',
        boxIsSelected: true,
        boxColor: Colors.red.shade300,
      ),
    );

    tips.add(
      TipsModel(
        name: 'Treino de Flexibilidade',
        iconPath: 'assets/icons/flexibilidade.png',
        level: 'Iniciante',
        duration: '1hr',
        calorie: '200kcal',
        boxIsSelected: true,
        boxColor: Colors.green.shade300,
      ),
    );

    tips.add(
      TipsModel(
        name: 'Treino Funcional',
        iconPath: 'assets/icons/funcional.png',
        level: 'Avançado',
        duration: '1hr 15min',
        calorie: '350kcal',
        boxIsSelected: true,
        boxColor: Colors.orange.shade300,
      ),
    );

    return tips;
  }
}
