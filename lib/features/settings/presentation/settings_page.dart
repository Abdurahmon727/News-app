import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/constants.dart';
import '../../../core/bloc/theme/theme_bloc.dart';
import '../../../core/widgets/w_scale.dart';
import 'widgets/view_option.dart';

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
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor.withOpacity(0.2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Padding(
                padding: EdgeInsets.only(left: 14),
                child: Text(
                  'Choose Primary Color',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
          child: WScaleAnimation(
            onTap: () => showBottomSheetToChangeViev(context),
            child: const ListTile(
              title: Text('Preview for news'),
              trailing: Icon(Icons.expand_more_outlined),
            ),
          ),
        ),
      ]),
    );
  }

  Future<dynamic> showBottomSheetToChangeViev(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 240,
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    'Choose one',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      WViewOption(
                        icon: const Icon(
                          Icons.style_rounded,
                          size: 40,
                        ),
                        title: 'Card',
                        isSelected: context.read<ThemeBloc>().state.isCardView,
                        onTap: () {
                          if (!context.read<ThemeBloc>().state.isCardView) {
                            context
                                .read<ThemeBloc>()
                                .add(const ThemeEvent.changeView());
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      WViewOption(
                        icon: const Icon(
                          Icons.list_alt_rounded,
                          size: 40,
                        ),
                        title: 'List',
                        isSelected: !context.read<ThemeBloc>().state.isCardView,
                        onTap: () {
                          if (context.read<ThemeBloc>().state.isCardView) {
                            context
                                .read<ThemeBloc>()
                                .add(const ThemeEvent.changeView());
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
