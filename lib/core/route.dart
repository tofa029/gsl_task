import '../../index.dart';

Map<String, WidgetBuilder> defaultRoutes = <String, WidgetBuilder> {
  '/': (context) => TicketsScreen(),
  '/profile': (context) => ProfileScreen(),
  '/contacts': (context) => ContactsScreen(),
};