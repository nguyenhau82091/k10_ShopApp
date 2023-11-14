import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k10_shopapp/constants.dart';
import 'package:k10_shopapp/model/setting_model.dart';

class SettingTile extends StatelessWidget {
  final Setting setting;

  const SettingTile({
    super.key,
    required this.setting,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (setting.route == "/") {
          // If the route is "/order", show the development notification
          showDevelopmentNotification(context);
        } else {
          // Otherwise, navigate to the specified route
          Navigator.pushNamed(context, setting.route);
        }
      },
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: klightContentColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(setting.icon, color: kprimaryColor),
          ),
          const SizedBox(width: 10),
          Text(
            setting.title,
            style: const TextStyle(
              color: kprimaryColor,
              fontSize: ksmallFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Icon(
            CupertinoIcons.chevron_forward,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }

  void showDevelopmentNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Tính năng này hiện đang được phát triển...'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
