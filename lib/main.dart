import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/gallery_provider.dart';
import 'package:task/provider/user_provider.dart';
import 'package:task/utils/localization/appLocalization.dart';
import 'package:task/utils/localization/localization.dart';
import 'package:task/view/pages/auth_pages/login_screen.dart';
import 'package:task/view/pages/gallery_pages/gallery_screen.dart';

import 'core/setting.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SettingsSession.loadLanguage();
  log("LanguageCode:${SettingsSession.languageCode}");
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
            ChangeNotifierProvider<GalleryProvider>(create: (_) => GalleryProvider()),
          ],
          child:MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Local local = Local();

    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Task',
          debugShowCheckedModeBanner: false,
          locale: local.appLocal,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', 'AR'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: ThemeData(
            fontFamily: 'segeo',
          ),
          home:  LoginScreen()

        );
      },
    );
  }
}
