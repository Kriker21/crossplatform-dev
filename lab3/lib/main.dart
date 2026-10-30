import 'package:flutter/material.dart';

import 'package:flutter_lab3/di/di.dart';
import 'package:flutter_lab3/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  FlutterError.onError = (details) {
    return talker.handle(details.exception, details.stack);
  };

  runApp(MyApp());
}
