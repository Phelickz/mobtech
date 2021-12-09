import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mobtech/app/app.dart';
import 'package:mobtech/app/locator/locator.dart';
import 'package:mobtech/app/services/db.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Sets logging level
  Logger.level = Level.debug;

  /// Register all the models and services before the app starts
  setupLocator();

  /// Runs the app :)
  runApp(MobtechApp());
}