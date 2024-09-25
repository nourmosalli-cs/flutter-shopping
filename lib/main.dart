import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/Divide/divide_cubit/cubit/divide_cubit.dart';
import 'package:shopping/Divide/divide_screen.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/src/data/cubit/auth_cubit.dart';
import 'package:shopping/src/routes/generate_route.dart';
import 'package:shopping/src/screen/auth/Profile_screen/cubit/theme_cubit.dart';
import 'package:shopping/src/screen/auth/auth_screen/cubit/screen/loginScreen.dart';
import 'package:shopping/src/shared/Network/local_network.dart';
import 'package:shopping/src/shared/constnts/constnts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
//getAppLicationDocumentsDirectory
  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  // OneSignal.shared.setAppId("b73afb7e-ef7f-447b-b33a-2bf0bfe24aa9");
  // OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
  //   print("fwnfj");
  // });

  await CacheNetwork.cacheInitialization();
  token = await CacheNetwork.getCacheData(key: 'token');
  currentpassword = await CacheNetwork.getCacheData(key: 'password');
  print("token is :$token");
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Future<Locale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString('locale') ?? 'en';
    return Locale(localeCode, '');
  }

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final Locale? locale;

  const MyApp({super.key, this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(
              create: (context) => DivideCubit()
                ..getcarts()
                ..getFavoritesData()
                ..getBannerData()
                ..getCategoriesData()
                ..getHomeData()),
          BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp(
                themeMode: state ? ThemeMode.dark : ThemeMode.light,
                darkTheme: ThemeData.dark(),
                theme: ThemeData(primarySwatch: Colors.blue),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,

                home: token != null ? DivideScreen() : loginScreen(),
                onGenerateRoute: generateRoute,

                //   token != null && token != "" ? DivideScreen() : loginScreen()
              ),
            );
          },
        ));
  }
}
