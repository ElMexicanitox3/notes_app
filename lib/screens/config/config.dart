import 'package:NoteHub/widgets/switch_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../providers/blocs/theme_bloc/theme.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Config"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                SettingsGroup(
                  title: 'General',
                  children: [
                    SettingsTile(
                      title: 'Theme',
                      subtitle: 'Dark Mode',
                      leading: Icons.brightness_4,
                      trailing: SwitchThemeCustom(),
                      onTap: () {
                        context.read<ThemeBloc>().add(ToggleThemeEvent());
                      },
                    ),
                    SettingsTile(
                      title: 'Language',
                      subtitle: 'English',
                      leading: Icons.language,
                      trailing: Text('English'),
                      onTap: () {},
                    ),
                  ],
                ),
                SettingsGroup(
                  title: 'Others',
                  children: [
                    SettingsTile(
                      title: 'About NoteHub',
                      leading: Icons.info,
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.pushNamed(context, '/about');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            // padding: const EdgeInsets.all(16.0),
            padding: EdgeInsets.only(bottom: 32.0),
            child: Text('Made with ❤️'),
          ),
        ],
      ),
    );
  }
}

class SettingsGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;

  SettingsGroup({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData leading;
  final Widget trailing;
  final VoidCallback onTap;

  SettingsTile({
    required this.title,
    this.subtitle,
    required this.leading,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      leading: Icon(leading),
      title: Text(title, style: TextStyle()),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
