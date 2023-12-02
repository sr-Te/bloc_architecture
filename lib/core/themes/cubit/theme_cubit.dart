import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  toggleTheme() {
    final theme = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(theme);
  }
}
