import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mone_note_app/injection.dart';
import 'package:mone_note_app/presentation/core/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.test); // test|prod
  runApp(const AppWidget());
}
