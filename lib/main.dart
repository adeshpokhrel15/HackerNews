import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:newshacker/VIew/homescreen.dart';

void main() {
  runApp(ProviderScope(child: News()));
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: homeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
