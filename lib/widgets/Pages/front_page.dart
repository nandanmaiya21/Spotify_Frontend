import 'package:flutter/material.dart';
import '../list_tiles.dart';
class FontPage extends StatelessWidget {
  const FontPage({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            //color: Colors.white,
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            height:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? (MediaQuery.of(context).size.height / 3.5)
                    : (MediaQuery.of(context).size.height / 1.2),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                mainAxisSpacing: MediaQuery.of(context).orientation ==
                        Orientation.landscape
                    ? 1
                    : 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (ctx, index) => gridViewPlayList(ctx),
              itemCount: 6,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            width: double.infinity,
            child: Text(
              'More of what you like',
              style: theme.textTheme.displayLarge,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, item) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, right: 15),
                  child: lisViewItem(context),
                );
              },
              itemCount: 6,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, top: 15),
            width: double.infinity,
            child: Text(
              'Popular artist',
              style: theme.textTheme.displayLarge,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            height: 200,
            // decoration:
            //     BoxDecoration(border: Border.all(color: Colors.red)),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, item) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15, top: 15),
                  child: listOfArtist(context),
                );
              },
              itemCount: 6,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 15),
            child: Row(
              children: [
                Container(
                  child: Image.asset(
                    fit: BoxFit.fitHeight,
                    'assets/images/SpotifyMixImage2.webp',
                    width: 50,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'More like',
                        style: theme.textTheme.displaySmall,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'My playlist',
                        style: theme.textTheme.displayMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
