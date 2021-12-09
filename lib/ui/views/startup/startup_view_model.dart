import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:mobtech/app/core/custom_base_view_model.dart';
import 'package:mobtech/app/locator/locator.dart';
import 'package:mobtech/app/router/router.dart';
import 'package:mobtech/app/services/router_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

class StartupViewModel extends CustomBaseViewModel {
  final RouterService _routerService = locator<RouterService>();

  Future<void> init() async {
    await requestPermission();
    await requestPermissionLocation();
    WidgetsBinding.instance!.addPostFrameCallback((Duration duration) async {
      Timer(
        Duration(
          seconds: 3,
        ),
        () async => await navigateToHomeView(),
      );
    });
  }

  Future navigateToHomeView() async {
      await _routerService.router.push(HomeRoute());
  }

  Future<void> requestPermission() async {
    var status = await Permission.phone.request();

    if (status.isGranted) {
      print('Granted');
    } else {}
  }

  Future<void> requestPermissionLocation() async {
    var status = await loc.Location().requestPermission();

    if (status == loc.PermissionStatus.granted) {
      print('Granted');
    } else {}
  }
}
