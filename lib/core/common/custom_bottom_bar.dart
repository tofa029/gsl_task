import 'package:flutter/material.dart';

/// A custom bottom bar which extends stateless widget
/// This widget provides a currentIndex
/// It is wrapped inside a [BottomNavigationBar] to design bottom bar
class CustomBottomBar extends StatelessWidget {
  /// The [currentIndex] is for display the selected page in the bottom bar as required param
  int currentIndex;

  CustomBottomBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.confirmation_num), label: "Tickets"),
        BottomNavigationBarItem(icon: Icon(Icons.contacts_outlined), label: 'Contacts'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: 'Profile'),
      ],
      onTap: (tappedIndex){
        if (tappedIndex != currentIndex) {
          switch (tappedIndex) {
            case 0:
              Navigator.of(context).pushReplacementNamed('/');
            case 1:
              Navigator.of(context).pushReplacementNamed('/contacts');
            case 2:
              Navigator.of(context).pushReplacementNamed('/profile');
          }
        }
      },
      currentIndex: currentIndex,
    );
  }
}
