import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/assets/constants.dart';
import 'package:news_app/core/widgets/w_scale.dart';

import '../../../../core/bloc/theme/theme_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        // Center(
        //   child: Text('Theme mode'),
        // ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor.withOpacity(0.2)),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => context
                    .read<ThemeBloc>()
                    .add(const ThemeEvent.changeUseSystemTheme()),
                child: ListTile(
                  title: const Text('Use system theme'),
                  trailing: Switch.adaptive(
                    activeColor: Theme.of(context).primaryColor,
                    value: context.watch<ThemeBloc>().state.useSystemTheme,
                    onChanged: (_) => context
                        .read<ThemeBloc>()
                        .add(const ThemeEvent.changeUseSystemTheme()),
                  ),
                ),
              ),
              Visibility(
                visible: !context.read<ThemeBloc>().state.useSystemTheme,
                child: GestureDetector(
                  onTap: () => context
                      .read<ThemeBloc>()
                      .add(const ThemeEvent.changeTheme()),
                  child: ListTile(
                    title: const Text('Theme Light/Dart'),
                    trailing: Switch.adaptive(
                      activeColor: Theme.of(context).primaryColor,
                      value: !context.watch<ThemeBloc>().state.isLight,
                      onChanged: (_) {
                        context
                            .read<ThemeBloc>()
                            .add(const ThemeEvent.changeTheme());
                      },
                    ),
                  ),
                ),
              ),
              const Text('Primary Color'),
              SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      WScaleAnimation(
                    onTap: () => context
                        .read<ThemeBloc>()
                        .add(ThemeEvent.changePrimaryColorIndex(index)),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: index ==
                                  context
                                      .read<ThemeBloc>()
                                      .state
                                      .primaryColorIndex
                              ? themePrimaryColors[index]
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Container(
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: themePrimaryColors[index],
                            shape: BoxShape.circle,
                          )),
                    ),
                  ),
                  itemCount: themePrimaryColors.length,
                  separatorBuilder: (__, _) => const SizedBox(width: 10),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor.withOpacity(0.2)),
          child: const ListTile(
            title: Text('Preview for news'),
            trailing: Icon(Icons.expand_more_outlined),
          ),
        ),
      ]),
    );
  }
}
