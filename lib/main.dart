import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/application/user.service.dart';
import 'package:flutter_application_1/common/constant/constants.dart';
import 'package:flutter_application_1/common/constant/languageCode.dart';
import 'package:flutter_application_1/common/helpers/config.dart';
import 'package:flutter_application_1/common/helpers/logging.dart';
import 'package:flutter_application_1/common/helpers/router_handler.dart';
import 'package:flutter_application_1/common/routes/routes.dart';
import 'package:flutter_application_1/common/theme/app_theme.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/Screens/Home/HomeScreen.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_application_1/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  Paint.enableDithering = true;

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await Hive.initFlutter('BlackHole/Database');
  } else if (Platform.isIOS) {
    await Hive.initFlutter('Database');
  } else {
    await Hive.initFlutter();
  }

  for (final box in HIVE_BOXES) {
    await openHiveBox(
      box['name'].toString(),
      limit: box['limit'] as bool? ?? false,
    );
  }
  if (Platform.isAndroid) {
    setOptimalDisplayMode();
  }
  await startService();

  runApp(const MainApp());
}

Future<void> setOptimalDisplayMode() async {
  await FlutterDisplayMode.setHighRefreshRate();
  // final List<DisplayMode> supported = await FlutterDisplayMode.supported;
  // final DisplayMode active = await FlutterDisplayMode.active;

  // final List<DisplayMode> sameResolution = supported
  //     .where(
  //       (DisplayMode m) => m.width == active.width && m.height == active.height,
  //     )
  //     .toList()
  //   ..sort(
  //     (DisplayMode a, DisplayMode b) => b.refreshRate.compareTo(a.refreshRate),
  //   );

  // final DisplayMode mostOptimalMode =
  //     sameResolution.isNotEmpty ? sameResolution.first : active;

  // await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!;
  }
}

class MainApp extends HookWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Locale _locale = const Locale('en', '');

    final GoRouter _router = GoRouter(routes: goRoutes);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil.setScreenSize(constraints, orientation);
          return MaterialApp.router(
            title: 'Grab',
            themeMode: AppTheme.themeMode,
            theme: AppTheme.lightTheme(context: context),
            locale: _locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: LanguageCodes.languageCodes.entries
                .map((e) => Locale(e.value, ''))
                .toList(),
            routerConfig: _router,
            // builder: (context, child) {
            //   return FlQueryDevtools(child: child!);
            // },
            // onGenerateRoute: (RouteSettings settings) {
            //   if (settings.name == '/player') {
            //     return PageRouteBuilder(
            //       opaque: false,
            //       pageBuilder: (_, __, ___) => const HomeScreen(),
            //     );
            //   }
            //   return HandleRoute.handleRoute(settings.name);
            // },
          );
        });
      }),
    );
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', '');
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // @override
  // void initState() {
  //   super.initState();
  //   var context = Hive.box('settings');
  //   var lang = context.get('lang');
  //   var systemLanguageCode = Platform.localeName.substring(0, 2);
  //   if (lang == null && LanguageCodes.languageCodes.containsKey(lang)) {
  //     _locale = Locale(systemLanguageCode);
  //   } else {
  //     _locale = Locale(LanguageCodes.languageCodes[lang ?? 'English'] ?? 'en');
  //   }

  //   AppTheme.currentTheme.addListener(() {
  //     setState(() {});
  //   });
  // }

  // void setLocale(Locale value) {
  //   setState(() {
  //     _locale = value;
  //   });
  // }

  final GoRouter _router = GoRouter(routes: goRoutes);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil.setScreenSize(constraints, orientation);
          return MaterialApp.router(
            title: 'Grab',
            themeMode: AppTheme.themeMode,
            theme: AppTheme.lightTheme(context: context),
            locale: _locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: LanguageCodes.languageCodes.entries
                .map((e) => Locale(e.value, ''))
                .toList(),
            routerConfig: _router,
            // builder: (context, child) {
            //   return FlQueryDevtools(child: child!);
            // },
            // onGenerateRoute: (RouteSettings settings) {
            //   if (settings.name == '/player') {
            //     return PageRouteBuilder(
            //       opaque: false,
            //       pageBuilder: (_, __, ___) => const HomeScreen(),
            //     );
            //   }
            //   return HandleRoute.handleRoute(settings.name);
            // },
          );
        });
      }),
    );
  }
}

Future<void> openHiveBox(String boxName, {bool limit = false}) async {
  final box = await Hive.openBox(boxName).onError((error, stackTrace) async {
    Logger.root.severe('Failed to open $boxName Box', error, stackTrace);
    final Directory dir = await getApplicationDocumentsDirectory();
    final String dirPath = dir.path;
    File dbFile = File('$dirPath/$boxName.hive');
    File lockFile = File('$dirPath/$boxName.lock');
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      dbFile = File('$dirPath/grab/$boxName.hive');
      lockFile = File('$dirPath/grab/$boxName.lock');
    }
    await dbFile.delete();
    await lockFile.delete();
    await Hive.openBox(boxName);
    throw 'Failed to open $boxName Box\nError: $error';
  });
  // clear box if it grows large
  if (limit && box.length > 500) {
    box.clear();
  }
}

Future<void> startService() async {
  await initializeLogging();
  await configureDependencies();
  GetIt.I.registerSingleton<MyTheme>(MyTheme());
}
