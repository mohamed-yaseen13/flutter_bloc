import 'package:flutter/material.dart';
import 'package:my_flutter_bloc/presentation/screens/character_details_screen.dart';
import 'package:my_flutter_bloc/presentation/screens/characters_screen.dart';
import 'package:my_flutter_bloc/routes/app_routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => CharactersScreen(),
        );
      case AppRoutes.details:
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(),
        );
    }
    return null;
  }
}
