import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'dart:math' as math;

Widget girdViewGenre(BuildContext context, List<Color> listColor) {
  return Container(
      key: UniqueKey(),
      padding: EdgeInsets.symmetric(vertical: 15),
      color: Theme.of(context).colorScheme.background,
      child: GridView.builder(
          itemCount: 59,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (ctx, index) => genreTile(index, ctx, listColor)));
}

Widget genreTile(int index, BuildContext context, List<Color> listColor) {
  return ZoomTapAnimation(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: listColor[index]),
      padding: EdgeInsets.only(top: 10, left: 10),
      margin: EdgeInsets.all(10),
      child: Stack(children: [
        Positioned(
            child: Text(
          'Genre',
          style:
              Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 23),
        )),
        Positioned(
            top: MediaQuery.of(context).orientation == Orientation.portrait
                ? 30
                : 80,
            left: MediaQuery.of(context).orientation == Orientation.portrait
                ? 100
                : 240,
            child: Transform.rotate(
              angle: math.pi / 9.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/pop_mix.png',
                  scale:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 3
                          : 2,
                ),
              ),
            ))
      ]),
    ),
  );
}

Widget printGrid(BuildContext context) {
  final theme = Theme.of(context);
  return Container(
    //color: Colors.white,
    padding: const EdgeInsets.all(15),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).orientation == Orientation.portrait
        ? (MediaQuery.of(context).size.height / 3.5)
        : (MediaQuery.of(context).size.height / 1.2),
    child: GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
        mainAxisSpacing:
            MediaQuery.of(context).orientation == Orientation.landscape
                ? 1
                : 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => gridViewPlayList(ctx),
      itemCount: 6,
    ),
  );
}

Widget gridViewPlayList(BuildContext context) {
  final theme = Theme.of(context);
  return ZoomTapAnimation(
    onTap: () {},
    child: Material(
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.grey.shade800,
      child: Container(
        // splashColor: theme.colorScheme.primary,
        child: Row(children: [
          Image.asset(
            alignment: Alignment.bottomLeft,
            height: 55,
            width: 55,
            'assets/images/pestControl.jpeg',
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Button',
            style: theme.textTheme.displayMedium,
          )
        ]),
      ),
    ),
  );
}

Widget lisViewItem(BuildContext context) {
  final theme = Theme.of(context);
  return Material(
    color: theme.colorScheme.background,
    child: ZoomTapAnimation(
      child: Column(
        children: [
          Image.asset(
            'assets/images/spotify.png',
            fit: BoxFit.cover,
            width: 130,
            height: 130,
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 130,
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              'Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text ',
              style: theme.textTheme.displaySmall!
                  .copyWith(height: 1.5, color: Colors.grey.shade400),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 6,
          ),
        ],
      ),
      onTap: () {},
    ),
  );
}

Widget listOfArtist(BuildContext context) {
  final theme = Theme.of(context);

  return Material(
    color: theme.colorScheme.background,
    child: ZoomTapAnimation(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/krsna.jpeg'),
            radius: 80,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Artist',
              style: theme.textTheme.displayMedium,
            ),
          )
        ],
      ),
    ),
  );
}
