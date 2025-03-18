import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(routes: defaultRoutes));
}

///extension for use sized box as gaps easily
extension PreSize on num{
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routes});

  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      navigatorKey: GlobalKey<NavigatorState>(),
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}