import '../../index.dart';

Map<String, WidgetBuilder> defaultRoutes = <String, WidgetBuilder> {
  '/': (context) => TicketsScreen(),
  '/profile': (context) => TicketsScreen(),
  '/contacts': (context) => ContactsScreen(),
};