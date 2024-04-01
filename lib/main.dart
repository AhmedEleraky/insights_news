import 'package:flutter/material.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/themes/theme.dart';
import 'package:insights_news/features/upload/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ProjectLocalStorage().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool? darkMode = ProjectLocalStorage.getCashedData('darkMode') ?? false;
    return MaterialApp(
      theme: ProjectTheme.projectLightTheme,
      darkTheme: ProjectTheme.projecDarkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
