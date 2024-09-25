import 'package:flutter/material.dart';
import 'package:shopping/src/screen/auth/Profile_screen/screen/Change_Password_Screen.dart';
import 'package:shopping/src/screen/auth/Profile_screen/screen/edit_screen.dart';
import 'package:shopping/src/screen/auth/Profile_screen/screen/help_screen.dart';
import 'package:shopping/src/screen/auth/Profile_screen/screen/search_screen.dart';
import 'package:shopping/src/screen/auth/Profile_screen/widget/lang.dart';
import 'package:shopping/src/screen/auth/auth_screen/cubit/screen/loginScreen.dart';
import 'package:shopping/src/screen/auth/auth_screen/cubit/screen/regScreen.dart';

MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/ChangePasswordScreen':
      return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
    case '/login':
      return MaterialPageRoute(builder: (_) => loginScreen());
    case '/divide':
      return MaterialPageRoute(builder: (_) => RegScreen());
    case '/Help': // تغيير إلى '/HelpScreen'
      return MaterialPageRoute(builder: (_) => HelpScreen());
    case '/MyPage':
      return MaterialPageRoute(builder: (_) => MyPage());
    case '/EditAccountScreen':
      return MaterialPageRoute(builder: (_) => const EditAccountScreen());
    default:
      return MaterialPageRoute(builder: (_) => const SearchScreen());
  }
}
