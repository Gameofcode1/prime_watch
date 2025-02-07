import 'package:flutter/material.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'injectory_container.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      initialRoute: AppRoutes.clockScreen,

    );
  }
}
