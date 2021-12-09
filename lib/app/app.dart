import 'package:flutter/material.dart';
    import 'package:mobtech/app/locator/locator.dart';
    import 'package:mobtech/app/services/router_service.dart';
import 'package:one_context/one_context.dart';

class MobtechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RouterService _routerService = locator<RouterService>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: OneContext.instance.builder,
      title: "Mobtech",
      routeInformationParser: _routerService.router.defaultRouteParser(),
      routerDelegate: _routerService.router.delegate(),
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
    );
  }
}