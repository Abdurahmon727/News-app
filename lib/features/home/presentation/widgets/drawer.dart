import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/w_scale.dart';
import '../pages/choose_topic_page.dart';
import '../pages/settings_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            WScaleAnimation(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ChooseTopicPage(),
                      ));
                },
                child: const ListTile(
                  leading: Icon(Icons.topic_rounded),
                  title: Text('Change topics'),
                )),
            WScaleAnimation(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const SettingsPage()),
                );
              },
              child: const ListTile(
                enableFeedback: true,
                leading: Icon(Icons.settings_rounded),
                title: Text('Settings'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
