import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_bloc/business_logic/cubit/characters_cubit.dart';
import 'package:my_flutter_bloc/data/api/api_service.dart';
import 'package:my_flutter_bloc/data/models/character_model.dart';
import 'package:my_flutter_bloc/data/repo/characters_repository.dart';
import 'package:my_flutter_bloc/presentation/screens/character_details_screen.dart';
import 'package:my_flutter_bloc/presentation/screens/characters_screen.dart';
import 'package:my_flutter_bloc/routes/app_routes.dart';

class AppRouter {
  static CharactersRepository charactersRepository = CharactersRepository(
    ApiService(),
  );

  static CharactersCubit charactersCubit = CharactersCubit(
    charactersRepository,
  );

  AppRouter() {
    charactersRepository = CharactersRepository(ApiService());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (BuildContext context) => charactersCubit,
                child: CharactersScreen(),
              ),
        );
      case AppRoutes.details:
        final selectedCharacter = settings.arguments as CharacterModel;
        return MaterialPageRoute(
          builder:
              (_) =>
                  CharacterDetailsScreen(selectedCharacter: selectedCharacter),
        );
    }
    return null;
  }
}
