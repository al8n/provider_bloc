import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_bloc/bloc/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var currentTheme = Provider.of<ThemeApp>(context);
    return Consumer<ThemeApp>(
      builder: (context, themeApp, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("首页"),
            centerTitle: true,
            backgroundColor: themeApp.appTheme.primaryColor,
          ),
          body: Container(
            color: themeApp.appTheme.secondaryHeaderColor,
            child: Center(
              child: Text(
                "自定义主题",
                style: TextStyle(
                  color: themeApp.appTheme.primaryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
