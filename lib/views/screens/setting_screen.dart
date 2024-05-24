import 'package:dars_3_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_uy_ishi/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

String image_address =
    "https://i.pinimg.com/736x/48/65/9d/48659d5543436e8714bef21c35e6f026.jpg";

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const SettingsScreen({
    super.key,
    required this.onThemeChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var controller = TextEditingController();
  String? error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        title: Text(
          "Sozlamalar",
          style: TextStyle(fontSize: AppConstants.textSize + 5),
        ),
        actions: [
          Text(
            AppConstants.language,
            style: TextStyle(
              fontSize: AppConstants.textSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      drawer: CustomDrawer(onThemeChanged: widget.onThemeChanged),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                image_address,
              ),
              fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: widget.onThemeChanged,
              title: Text("Tungi holat",
                  style: TextStyle(fontSize: AppConstants.textSize)),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: const Icon(
                        Icons.image,
                      ),
                      hintText: "Picture link...",
                      errorText: error,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (controller.text.isEmpty) {
                          error = "rasm linkini kirtish shart!";
                        } else {
                          error = null;
                          image_address = controller.text;
                          controller.clear();
                        }
                      });
                    },
                    child: Text(
                      "Saqlash",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: AppConstants.textSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DropdownButton(
                    hint: Text(AppConstants.language,
                        style: TextStyle(fontSize: AppConstants.textSize)),
                    items: const [
                      DropdownMenuItem(
                        value: "UZ",
                        child: Text(
                          "UZ",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "ENG",
                        child: Text(
                          "ENG",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "RUS",
                        child: Text(
                          "RUS",
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        AppConstants.language = value!;
                      });
                    },
                  ),
                  DropdownButton(
                    hint: Container(
                        color: AppConstants.appBarColor,
                        child: Text("Change Color",
                            style: TextStyle(fontSize: AppConstants.textSize))),
                    padding: EdgeInsets.all(0),
                    items: [
                      DropdownMenuItem(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          color: Colors.green,
                        ),
                        value: Colors.green,
                      ),
                      DropdownMenuItem(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          color: Colors.amber,
                        ),
                        value: Colors.amber,
                      ),
                      DropdownMenuItem(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          color: Colors.purpleAccent,
                        ),
                        value: Colors.purpleAccent,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        AppConstants.appBarColor = value!;
                      });
                    },
                  ),
                  DropdownButton(
                      hint: Text(
                        "Shrift",
                        style: TextStyle(fontSize: AppConstants.textSize),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "kichik",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          value: 12.0,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "o'rtacha",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          value: 18.0,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "katta",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          value: 24.0,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          AppConstants.textSize = value!;
                        });
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
