import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app/app.dart';
import 'package:navigation/app/di/di.dart';
import 'package:navigation/common/data/app_environment.dart';
import 'package:navigation/common/logger/appenders/console_logger_appender.dart';
import 'package:navigation/common/logger/logger.dart';

const Logger _logger = Logger('main');

/// Default environment is development.
void main() {
  runNavigationApp(AppEnvironment.development);
}

Future<void> runNavigationApp(AppEnvironment environment) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await _configureLogger(environment);

      await EasyLocalization.ensureInitialized();
      configureDependencies(environment);

      _runApp();
    },
    (error, stackTrace) {
      _logger.logError(error, stackTrace);
    },
  );
}

Future<void> _configureLogger(AppEnvironment environment) async {
  if (kDebugMode) {
    Logger.addAppender(const ConsoleLoggerAppender());
  }
}

void _runApp() {
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const NavigationApp(),
    ),
  );
}
