import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tw_global_service_task/core/InitialBinding.dart';
import 'package:tw_global_service_task/core/router/router.dart';

void main() {
  InitialBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: onGenerateRoutes,
      title: 'Pixabay Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
        useMaterial3: true,
      ),
    );
  }
}
