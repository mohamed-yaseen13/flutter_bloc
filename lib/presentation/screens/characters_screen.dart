import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_bloc/business_logic/cubit/characters_cubit.dart';
import 'package:my_flutter_bloc/constants/app_colors.dart';
import 'package:my_flutter_bloc/data/models/character_model.dart';
import 'package:my_flutter_bloc/presentation/widgets/character_grid_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appYellow,
        title:
            isSearching
                ? buildSearchField()
                : Text('Charcters', style: TextStyle(color: AppColors.appGrey)),
        actions: isSearching ? [clearIcon()] : [searchIcon()],
      ),
      body: buildCharactersBloc(),
    );
  }

  Widget buildCharactersBloc() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildCharactersGridView();
        } else {
          return Center(
            child: CircularProgressIndicator(color: AppColors.appYellow),
          );
        }
      },
    );
  }

  Widget buildCharactersGridView() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.appGrey,
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount:
                  searchTextController.text.isEmpty
                      ? allCharacters.length
                      : searchedCharacters.length,
              itemBuilder: (context, index) {
                return CharacterGridItem(
                  character:
                      searchTextController.text.isEmpty
                          ? allCharacters[index]
                          : searchedCharacters[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<CharacterModel> allCharacters = [];

  List<CharacterModel> searchedCharacters = [];

  bool isSearching = false;

  final searchTextController = TextEditingController();

  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: AppColors.appGrey,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.appGrey, fontSize: 18),
      ),
      style: TextStyle(color: AppColors.appGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        filterCharacters(searchedCharacter);
      },
    );
  }

  void filterCharacters(String searchedCharacter) {
    searchedCharacters =
        allCharacters
            .where(
              (char) => char.name.toLowerCase().startsWith(searchedCharacter),
            )
            .toList();
    setState(() {});
  }

  Widget clearIcon() {
    return IconButton(
      onPressed: () {
        stopSearch();
        Navigator.pop(context);
      },
      icon: Icon(Icons.clear, color: AppColors.appGrey),
    );
  }

  Widget searchIcon() {
    return IconButton(
      onPressed: () {
        startSearch();
      },
      icon: Icon(Icons.search, color: AppColors.appGrey),
    );
  }

  void startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));

    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    setState(() {
      searchTextController.clear();
      isSearching = false;
    });
  }
}
