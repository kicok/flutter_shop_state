import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    WidgetBuilder builder,
    RouteSettings settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child, // 페이지
  ) {
    if (settings.name == '/') {
      //  앱에서 제공하는 첫번째 초기경로
      return child;
    }

    return FadeTransition(
      // 첫번째 경로가 아닌경우 페이지 전환
      opacity: animation,
      child: child,
    );
  }
}

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child, // 페이지
  ) {
    if (route.settings.name == '/') {
      //  앱에서 제공하는 첫번째 초기경로
      return child;
    }

    return FadeTransition(
      // 첫번째 경로가 아닌경우 페이지 전환
      opacity: animation,
      child: child,
    );
  }
}
