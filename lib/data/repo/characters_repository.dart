import 'package:my_flutter_bloc/data/api/api_service.dart';
import 'package:my_flutter_bloc/data/models/character_model.dart';

class CharactersRepository {
  final ApiService apiService;

  CharactersRepository(this.apiService);

  Future<List<CharacterModel>> getAllCharacters() async {
    final character = await apiService.getAllCharacters();

    return character
        .map((character) => CharacterModel.fromJson(character))
        .toList();
  }
}
