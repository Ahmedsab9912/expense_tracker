import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColor,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColor.onPrimaryContainer,
          foregroundColor: kColor.primaryContainer,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Expenses(),
      themeMode: ThemeMode.system,
    ),
  );
}
