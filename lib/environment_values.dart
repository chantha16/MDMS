import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _baseUrl = data['baseUrl'];
      _clientId = data['clientId'];
      _clientSecret = data['clientSecret'];
      _issuer = data['issuer'];
      _realm = data['realm'];
      _scope = data['scope'];
      _grantType = data['grantType'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _baseUrl = '';
  String get baseUrl => _baseUrl;

  String _clientId = '';
  String get clientId => _clientId;

  String _clientSecret = '';
  String get clientSecret => _clientSecret;

  String _issuer = '';
  String get issuer => _issuer;

  String _realm = '';
  String get realm => _realm;

  String _scope = '';
  String get scope => _scope;

  String _grantType = '';
  String get grantType => _grantType;
}
