import 'package:flutter/material.dart';
import 'package:money_app/homeScreen/homeScreen.dart';

class moneyManagerBottomNavigatopnBar extends StatelessWidget {
  const moneyManagerBottomNavigatopnBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: homeScreen.selected,
      builder: (context, updatedindex, _) {
        return BottomNavigationBar(
          currentIndex: updatedindex,
          onTap: (newindex) {
            homeScreen.selected.value = newindex;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Transactions'),

            BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Catagories'),
          ],
        );
      },
    );
  }
}
