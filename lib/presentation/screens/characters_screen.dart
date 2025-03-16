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
  List<CharacterModel> allCharacters = [];

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
        title: Text('Charcters', style: TextStyle(color: AppColors.appGrey)),
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
              itemCount: allCharacters.length,
              itemBuilder: (context, index) {
                return CharacterGridItem(character: allCharacters[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
