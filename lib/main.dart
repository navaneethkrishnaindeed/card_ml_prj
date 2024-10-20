import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'precentation/app.dart';

Future<void> main() async {
  await Hive.initFlutter();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
