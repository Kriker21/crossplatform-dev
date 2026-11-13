import 'package:flutter/material.dart';

import 'package:flutter_lab5/di/di.dart';
import 'package:flutter_lab5/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  FlutterError.onError = (details) {
    return talker.handle(details.exception, details.stack);
  };

  runApp(MyApp());
}
