import 'package:flutter/foundation.dart';
import 'package:provider_bloc/constants/theming.dart';
import 'package:flutter/material.dart';

class ThemeApp with ChangeNotifier {
  ThemeData _appTheme ;
  final int themeIndex;
  ThemeData get appTheme => _appTheme;


  set appTheme(ThemeData newTheme) {
    _appTheme = newTheme;
    notifyListeners();
  }


  ThemeApp({
    @required this.themeIndex,
  }) {
    this.appTheme = PBAppTheme[this.themeIndex];
  }

}
