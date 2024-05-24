import 'package:dars_3_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_uy_ishi/views/screens/home_screen.dart';
import 'package:dars_3_uy_ishi/views/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  const CustomDrawer({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppConstants.appBarColor,
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Mehmonxonalar", style: TextStyle(fontSize: AppConstants.textSize),),
                Text("MENYU", style: TextStyle(fontSize: AppConstants.textSize)),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return HomeScreen(
                      onThemeChanged: onThemeChanged,
                    );
                  },
                ),
              );
            },
            title:  Text("Bosh sahifa", style: TextStyle(fontSize: AppConstants.textSize)),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen(
                      onThemeChanged: onThemeChanged,
                    );
                  },
                ),
              );
            },
            title:  Text("Sozlamalar", style: TextStyle(fontSize: AppConstants.textSize)),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
