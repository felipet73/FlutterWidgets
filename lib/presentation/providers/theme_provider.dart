
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorList);

final isDarkModeProvider = StateProvider((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);

// Objeto de tipo AppThme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  //ThemeNotifier(super.state);
  ThemeNotifier():super(AppTheme());

  void toggleDarkMode(){
    state = state.copyWith(isDarkmode:!state.isDarkmode );
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor:colorIndex );
  }

}