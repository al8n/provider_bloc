import 'package:flutter/material.dart';
import 'package:provider_bloc/constants/theming.dart';
import 'package:provider/provider.dart';
import 'package:provider_bloc/bloc/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';




class ThemeSettingPage extends StatelessWidget {

  setThemeIndex(int index) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt("themeIndex", index);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeApp>(
      builder: (context, themeApp, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("设置"),
            centerTitle: true,
            backgroundColor: themeApp.appTheme.primaryColor,
          ),
          body: Container(
            color: themeApp.appTheme.secondaryHeaderColor,
            child: Center(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setThemeIndex(index);
                      ThemeData newTheme = PBAppTheme[index];
                      themeApp.appTheme = newTheme;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: PBAppTheme[index].primaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(10.0),
                    ),
                  );
                },
                reverse: false,
                itemCount: PBAppTheme.length,
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
        );
      },
    );
  }
}