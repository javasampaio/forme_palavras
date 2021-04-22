import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  factory AppConfig({appName, flavorName, apiBaseUrl, child}) {
    _instance ??= AppConfig._internalConstructor(
      appName: appName,
      flavorName: flavorName,
      apiBaseUrl: apiBaseUrl,
      child: child,
    );
    return _instance;
  }

  AppConfig._internalConstructor({
    appName,
    flavorName,
    apiBaseUrl,
    @required Widget child,
  }) : super(child: child) {
    AppConfig._appName = appName;
    AppConfig._flavorName = flavorName;
    AppConfig._repositoryBaseUrl = apiBaseUrl;
  }

  static AppConfig _instance;
  static String _appName;
  static String _flavorName;
  static String _repositoryBaseUrl;

  static String getAppName() => _appName;

  static String getFlavorName() => _flavorName;

  static String getBaseUrl() => _repositoryBaseUrl;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
