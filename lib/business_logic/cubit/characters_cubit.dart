import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:my_flutter_bloc/data/models/character_model.dart';
import 'package:my_flutter_bloc/data/repo/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;

  List<CharacterModel> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    charactersRepository.getAllCharacters().then((Characters) {
      emit(CharactersLoaded(characters: Characters));
      this.characters = characters;
    });
    return characters;
  }
}
