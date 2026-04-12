import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int currentIndex = 2;

  final List<Widget> pages = const [
    PlaceholderPage(title: "Exercise Page"),
    PlaceholderPage(title: "Meals Page"),
    PlaceholderPage(title: "Home Page"),
    PlaceholderPage(title: "Training Page"),
    PlaceholderPage(title: "Events Page"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: AppTheme.primaryBlue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "Exercise"),
            BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Meals"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.sports_mma), label: "Training"),
            BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          ],
        ),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Blank Page (You will edit later)",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}