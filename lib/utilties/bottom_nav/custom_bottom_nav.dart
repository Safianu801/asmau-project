import 'package:first_project/screens/accounts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _currentScreen = 0;

  final List _screens = [
    Text("Home"),
    Text("Shop"),
    Text("Wishlist"),
    Text("Magazine"),
    AccountsScreen(),
  ];

  void _onClick(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: _screens[_currentScreen],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: _onClick,
          currentIndex: _currentScreen,
          items: [
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.search),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.heart),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.document),
              label: "Magazine",
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
