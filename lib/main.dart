import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_bloc/pages/home_page.dart';
import 'package:provider_bloc/pages/theme_setting.dart';
import 'package:provider_bloc/constants/theming.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider_bloc/bloc/theme.dart';

Future<int> _getThemeIndexFromStorage() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  int themeIndex = sp.getInt("themeIndex");
  if (themeIndex == null) {
    return 0;
  }
  return themeIndex;
}

void main() async {
  int themeIndex = await _getThemeIndexFromStorage();
  print(themeIndex);
  runApp(
    new MyApp(
      themeIndex: themeIndex,
    ),
  );
}

class MyApp extends StatelessWidget {
  final int themeIndex;

  MyApp({
    Key key,
    this.themeIndex,
  }):super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => new ThemeApp(
        themeIndex: themeIndex
      ),
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    ThemeSettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeApp>(
      builder: (context, themeApp, _) {
        return MaterialApp(
          theme: themeApp.appTheme,
          home: Scaffold(
            body: pages[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("首页"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text("设置"),
                ),
              ],
              currentIndex: _currentIndex,
              selectedIconTheme: IconThemeData(
                size: 30.0,
              ),
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),// This trailing comma makes auto-formatting nicer for build methods.
          ),
        );
      },
    );
  }
}

