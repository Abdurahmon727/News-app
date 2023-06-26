import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/theme/theme_bloc.dart';

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
              title: const Text('Theme'),
              trailing: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Switch.adaptive(
                    value: context.read<ThemeBloc>().state.isLight,
                    onChanged: (val) {
                      context
                          .read<ThemeBloc>()
                          .add(ThemeEvent.changeTheme(isLight: val));
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
