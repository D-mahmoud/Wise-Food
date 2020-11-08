import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Settings',
            tiles: [
              SettingsTile(
                title: 'Account Info',
                leading: Icon(Icons.info),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Saved Adresses',
                leading: Icon(Icons.label),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Currency',
                subtitle: 'EGP',
                leading: Icon(Icons.account_balance_wallet),
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(tiles: [
            SettingsTile(
              title: 'Notifications',
              subtitle: 'Enabled',
              leading: Icon(Icons.notifications),
              onTap: () {},
            ),
          ]),
          SettingsSection(
            tiles: [
              SettingsTile(
                title: 'Country',
                subtitle: 'Egypt',
                leading: Icon(Icons.location_city),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            tiles: [
              SettingsTile(
                title: 'Logout',
                leading: Icon(Icons.logout),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
