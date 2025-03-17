import 'package:flutter/material.dart';
import 'package:my_flutter_bloc/constants/app_colors.dart';
import 'package:my_flutter_bloc/data/models/character_model.dart';
import 'package:my_flutter_bloc/presentation/widgets/character_text.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel selectedCharacter;
  const CharacterDetailsScreen({super.key, required this.selectedCharacter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('status : ', selectedCharacter.status),
                    buildDivider(315),
                    characterInfo('species : ', selectedCharacter.species),
                    buildDivider(305),
                    characterInfo('gender : ', selectedCharacter.gender),
                    buildDivider(310),
                    characterInfo(
                      'episode : ',
                      selectedCharacter.episode.join(' / '),
                    ),
                    buildDivider(305),
                    characterInfo('url : ', selectedCharacter.url),
                    buildDivider(345),
                    characterInfo('created : ', selectedCharacter.created),
                    buildDivider(305),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 500),
            ]),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      backgroundColor: AppColors.appGrey,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: CharacterText(character: selectedCharacter),
        background: Hero(
          tag: selectedCharacter.id,
          child: Image.network(selectedCharacter.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: AppColors.appWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: AppColors.appWhite, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: AppColors.appYellow,
      thickness: 2,
    );
  }
}
