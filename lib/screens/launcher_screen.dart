import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../theme/theme.dart';
import '../routes/routes.dart';

class LauncherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Designs - Phone'),
        backgroundColor: appTheme.accentColor,
      ),
      body: _OptionsList(),
      drawer: _MainMenu(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: screenRoutes.length,
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          screenRoutes[index].icon,
          color: appTheme.accentColor,
        ),
        title: Text(screenRoutes[index].title),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor,),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screenRoutes[index].screen),
          );
        },
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final accentColor = themeChanger.currentTheme.accentColor;
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                height: 200,
                width: double.infinity,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(
                    'fg',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _OptionsList()),
            ListTile(
              title: Text('Dark Mode'),
              leading: Icon(
                Icons.lightbulb_outline,
                color: accentColor,
              ),
              trailing: Switch.adaptive(
                  value: themeChanger.darkTheme,
                  activeColor: accentColor,
                  onChanged: (value) {
                    themeChanger.darkTheme = value;
                  }),
            ),
            SafeArea(
              bottom: true,
              left: false,
              right: false,
              top: false,
              child: ListTile(
                title: Text('Custom Theme'),
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: accentColor,
                ),
                trailing: Switch.adaptive(
                    value: themeChanger.customTheme,
                    activeColor: accentColor,
                    onChanged: (value) {
                      themeChanger.customTheme = value;
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
