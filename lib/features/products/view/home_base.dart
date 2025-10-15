import 'package:flutter/material.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';

class HomeBase extends StatelessWidget {
  const HomeBase({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        height: 62,
        decoration: BoxDecoration(
          color: context.white,
          border: Border(
            top: BorderSide(color: context.greyBorder, width: 1.5),
          ),
        ),

        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavBarItem(icon: Icons.home, label: 'home', isSelected: true),
            BottomNavBarItem(icon: Icons.shopping_cart, label: 'cart'),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
  });
  final IconData icon;
  final String label;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          Text(label),
          if (isSelected)
            Container(
              width: 70,
              height: 5,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 2, left: .3, right: .3),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(55),
              ),
              child: Container(
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
