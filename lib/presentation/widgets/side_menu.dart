import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  
  final GlobalKey<ScaffoldState> scaffoldkey;
  const SideMenu({super.key, required this.scaffoldkey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex=value;  
        });
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldkey.currentState?.closeDrawer();
      },
      children: [

        Padding(
          padding: EdgeInsets.fromLTRB(28,hasNotch ? 10:20,16,10),
          child: const Text('Main Menu'),
        ),

        ...appMenuItems
        .sublist(0,3)
        .map( (item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label: Text(item.title)) ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Divider(),
          ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More options'),
          ),

        ...appMenuItems
        .sublist(3)
        .map( (item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label: Text(item.title)) ),          

        /*NavigationDrawerDestination(
          icon: Icon(Icons.add_shopping_cart_rounded), 
          label: const Text('otra pantalla')),*/

      ],
    );
  }
}