import 'package:workout_app/pages/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/pages/setting_page.dart';

class HomePageRoutes extends StatefulWidget {
  const HomePageRoutes({
    super.key,
  });

  @override
  State<HomePageRoutes> createState() => _HomePageRoutesState();
}

class _HomePageRoutesState extends State<HomePageRoutes> {
  int _currentPageIndex = 0;
  final PageController _currentPageController = PageController(initialPage: 0);
  Color _navBarBackColor = Colors.grey.shade700;

  @override
  void initState() {
    super.initState();
    _currentPageController.addListener(() {
      setState(() {
        _currentPageIndex = _currentPageController.page?.round() ?? 0;
        _navBarBackColor = _currentPageIndex == 0
            ? Colors.grey.shade700
            : Colors.grey.shade900;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _currentPageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: const [
          HomePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 25),
        color: _navBarBackColor,
        child: CurvedNavigationBar(
          index: _currentPageIndex,
          onTap: (index) {
            _currentPageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          items: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
          ],
          height: 60,
          backgroundColor: Colors.transparent,
          color: Colors.grey.shade900,
          animationDuration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
