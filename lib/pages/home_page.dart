import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_app/models/category_models.dart';
import 'package:workout_app/models/tips_model.dart';
import 'package:workout_app/models/trainer_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<TrainerModel> trainers = [];
  List<TipsModel> tips = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    trainers = TrainerModel.getTrainers();
    tips = TipsModel.getTips();
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          title: Text(
            'F I T N E S S  A P P',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            // Adiciona um IconButton na AppBar para voltar para a tela de LoginPage
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ), // Use o ícone desejado, por exemplo, Icons.logout
              onPressed: logout,
            ),
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(height: 40),
            _categoriesSection(),
            const SizedBox(height: 40),
            _trainersSection(),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Dicas',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ListView.separated(
                  itemCount: tips.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 25),
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: tips[index].boxIsSelected
                            ? trainers[index].boxColor.withOpacity(0.3)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: tips[index].boxIsSelected
                            ? [
                                BoxShadow(
                                    color: const Color(0xff1D1617)
                                        .withOpacity(0.07),
                                    offset: const Offset(0, 10),
                                    blurRadius: 40,
                                    spreadRadius: 0),
                              ]
                            : [],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            tips[index].iconPath,
                            width: 65,
                            height: 65,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tips[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${tips[index].level} | ${tips[index].duration} | ${tips[index].calorie}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/icons/arrow.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
            const SizedBox(height: 40),
          ],
        ));
  }

  Column _trainersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Tipos de Treinos',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: trainers[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(trainers[index].iconPath),
                    Column(
                      children: [
                        Text(
                          trainers[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade100,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${trainers[index].level} | ${trainers[index].duration} | ${trainers[index].calorie}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 223, 215, 216),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            trainers[index].viewIsSelected
                                ? Colors.grey.shade800
                                : Colors.transparent,
                            trainers[index].viewIsSelected
                                ? Colors.grey.shade900
                                : Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'Veja',
                          style: TextStyle(
                            color: trainers[index].viewIsSelected
                                ? Colors.white
                                : Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: trainers.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
          ),
        )
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Exercícios',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 150,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white12,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Image.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade100,
                          fontSize: 14),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
