import 'package:dars_3_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_uy_ishi/views/screens/setting_screen.dart';
import 'package:dars_3_uy_ishi/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const HomeScreen({
    super.key,
    required this.onThemeChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        title:  Text(
          "Bosh Sahifa",
           style: TextStyle(fontSize: AppConstants.textSize)
        ),
        actions: [
          Text(
            AppConstants.language,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      drawer: CustomDrawer(
        onThemeChanged: widget.onThemeChanged,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              image_address,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
