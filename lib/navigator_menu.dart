import 'package:echofetch/features/chatbot/screens/chat_screen.dart';
import 'package:echofetch/features/pickup/screens/pickup_screen.dart';
import 'package:echofetch/features/reward/screens/reward_screen.dart';
import 'package:echofetch/features/shop/screens/shop_screen.dart';
import 'package:echofetch/screens/community_screen.dart';
import 'package:echofetch/screens/homscreen.dart';
import 'package:flutter/material.dart';



class NavigatorMenu extends StatefulWidget {
  const NavigatorMenu({super.key});

  @override
  State<NavigatorMenu> createState() {
    return _NavigatorMenuState();
  }
}

class _NavigatorMenuState extends State<NavigatorMenu> {
  int currentScreenIndex = 0;
  Widget? currentScreen;
  String currentScreenTitle = 'Home';

  void _changeScreen(int index) {
    setState(
      () {
        currentScreenIndex = index;
        switch (index) {
          case 0:
            currentScreen = HomeScreen();
            currentScreenTitle = 'Home';
            break;
          case 1:
            currentScreen = const PickupScreen();
            currentScreenTitle = 'Pickup';
            break;
          case 2:
            currentScreen = const ShopScreen();
            currentScreenTitle = 'Shop';
            break;
          case 3:
            currentScreen = CommunityScreen();
            currentScreenTitle = 'Community';
            break;
          case 4:
            currentScreen = const RewardScreen();
            currentScreenTitle = 'Rewards';
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentScreenTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: colorScheme.onSurface,
              )),
          Icon(Icons.person),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatbotScreen(),
          ));
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.chat, color: Theme.of(context).colorScheme.onPrimary),
      ),
      bottomNavigationBar: NavigationBar(
        elevation: 12,
        
        onDestinationSelected: (int index) {
          _changeScreen(index);
        },
        selectedIndex: currentScreenIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.fire_truck_sharp),
            icon: Icon(Icons.fire_truck_sharp),
            label: 'Pickup',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.shopping_cart,
            ),
            icon: Badge(child: Icon(Icons.shopping_cart_outlined)),
            label: 'Shop',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.people,
            ),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.people_outline),
            ),
            label: 'Community',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.celebration,
            ),
            icon: Badge(child: Icon(Icons.celebration)),
            label: 'Rewards',
          ),
        ],
      ),
      body: currentScreen==null ? HomeScreen() : currentScreen,
    );
  }
}
