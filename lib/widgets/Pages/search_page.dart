import 'package:flutter/material.dart';
import '../list_tiles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
    required this.theme,
    required this.appBar,
    required this.listColor,
  });

  final ThemeData theme;
  final AppBar appBar;
  final List<Color> listColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.colorScheme.background,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    90,
                child: girdViewGenre(context, listColor)),
          ],
        ),
      ),
    );
  }
}
