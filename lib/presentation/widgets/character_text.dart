import 'package:flutter/material.dart';
import 'package:my_flutter_bloc/constants/app_colors.dart';
import 'package:my_flutter_bloc/data/models/character_model.dart';

class CharacterText extends StatelessWidget {
  final CharacterModel character;
  const CharacterText({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.black54,
      child: Text(
        character.name,
        style: TextStyle(
          height: 0.5,
          fontSize: 16,
          color: AppColors.appWhite,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
