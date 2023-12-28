import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';
//import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
//import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
//import 'package:widgets_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp())
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final int selectedColor = ref.watch(selectedColorProvider);
    final bool isDarkmode = ref.watch(isDarkModeProvider);
    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectedColor, isDarkmode: isDarkmode).getTheme(),
      //home: const HomeScreen(),
      /*routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      }*/
    );
  }
}
