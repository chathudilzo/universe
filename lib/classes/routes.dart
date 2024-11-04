import 'package:flutter/material.dart';

class Routes {
  // A method to return a page route without animations
  static Route<dynamic> noAnimation({
    required RouteSettings settings,
    required WidgetBuilder builder,
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}
