import 'package:flutter/material.dart';
import 'package:my_flutter_bloc/constants/app_colors.dart';
import 'package:my_flutter_bloc/data/models/character_model.dart';
import 'package:my_flutter_bloc/presentation/widgets/character_text.dart';
import 'package:my_flutter_bloc/routes/app_routes.dart';

class CharacterGridItem extends StatelessWidget {
  final CharacterModel character;
  const CharacterGridItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColors.appWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap:
            () => Navigator.pushNamed(
              context,
              AppRoutes.details,
              arguments: character,
            ),
        child: GridTile(
          child: Hero(
            tag: character.id,
            child: Container(
              color: AppColors.appGrey,
              child:
                  character.image.isNotEmpty
                      ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: 'assets/images/loading.gif',
                        image: character.image,
                        fit: BoxFit.cover,
                      )
                      : Image.asset('assets/images/placeholder.jpg'),
            ),
          ),
          footer: CharacterText(character: character),
        ),
      ),
    );
  }
}
