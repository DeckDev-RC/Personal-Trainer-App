import 'package:flutter/material.dart';

class TrainerModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;
  Color boxColor;

  TrainerModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
    required this.boxColor,
  });

  static List<TrainerModel> getTrainers() {
    List<TrainerModel> trainers = [];

    trainers.add(
      TrainerModel(
        name: 'Treino para Força',
        iconPath: 'assets/icons/treino_forca.png',
        level: 'Díficil',
        duration: '2hrs',
        calorie: '180kcal',
        viewIsSelected: true,
        boxColor: Colors.grey.shade300,
      ),
    );

    trainers.add(
      TrainerModel(
        name: 'Treino para Resistência',
        iconPath: 'assets/icons/treino_resistencia.png',
        level: 'Díficil',
        duration: '3hrs',
        calorie: '180kcal',
        viewIsSelected: true,
        boxColor: Colors.grey.shade300,
      ),
    );

    trainers.add(
      TrainerModel(
        name: 'Treino para Velocidade',
        iconPath: 'assets/icons/treino_cardio.png',
        level: 'Médio',
        duration: '2hrs',
        calorie: '180kcal',
        viewIsSelected: true,
        boxColor: Colors.grey.shade300,
      ),
    );

    trainers.add(
      TrainerModel(
        name: 'Treino para Saúde',
        iconPath: 'assets/icons/ioga.png',
        level: 'Fácil',
        duration: '1hr',
        calorie: '180kcal',
        viewIsSelected: true,
        boxColor: Colors.grey.shade300,
      ),
    );

    return trainers;
  }
}
