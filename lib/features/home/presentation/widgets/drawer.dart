import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/theme/theme_bloc.dart';
import '../../../../core/widgets/w_scale.dart';
import '../pages/choose_topic_page.dart';

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
            ListTile(
              title: const Text('Theme Light/Dart'),
              trailing: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Switch.adaptive(
                    value: !state.isLight,
                    onChanged: (val) {
                      context
                          .read<ThemeBloc>()
                          .add(ThemeEvent.changeTheme(isLight: !val));
                    },
                  );
                },
              ),
            ),
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
                  title: Text('Change topics'),
                )),
            ListTile(
              title: const Text('View Card/List'),
              trailing: Builder(
                builder: (context) {
                  return Switch.adaptive(
                    value: !context.watch<ThemeBloc>().state.isCardView,
                    onChanged: (val) {
                      context
                          .read<ThemeBloc>()
                          .add(ThemeEvent.changeView(isCardView: !val));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
