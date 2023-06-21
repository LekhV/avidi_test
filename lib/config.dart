import 'package:injectable/injectable.dart';

@singleton
class AppConfig {
  String baseUrl = 'https://www.disify.com/api';
}

final AppConfig config = AppConfig();
