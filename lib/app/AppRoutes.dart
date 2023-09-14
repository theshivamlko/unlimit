import 'package:go_router/go_router.dart';
import 'package:unlimit/presentation/history/HistoryPage.dart';
import 'package:unlimit/presentation/homepage/MyHomePage.dart';

final GoRouter goRouter = GoRouter(routes: [
  GoRoute(
    name: RouteName.homePage,
    path: "/",
    builder: (context, state) {
      return MyHomePage();
    },
  ),
  GoRoute(
    name: RouteName.historyPage,
    path: "/jokeList",
    builder: (context, state) {
      return HistoryPage();
    },
  )
]);

class RouteName{
 static const  String homePage="homePage";
 static const String historyPage="historyPage";
}
