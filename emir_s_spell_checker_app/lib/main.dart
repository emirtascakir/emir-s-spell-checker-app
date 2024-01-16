import 'package:emir_s_spell_checker_app/provider/correction_provider.dart';
import 'package:emir_s_spell_checker_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CorrectionProvider>(
          create: (_) => CorrectionProvider())
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  ));
}
