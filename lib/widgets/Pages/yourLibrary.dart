import 'package:flutter/material.dart';
import 'dart:math' as math;

class YourLibrary extends StatelessWidget {
  const YourLibrary({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListWheelScrollView.useDelegate(
          onSelectedItemChanged: (index) {
            print('$index');
          },
          magnification: 1.1,
          useMagnifier: true,
          physics: FixedExtentScrollPhysics(),
          perspective: 0.001,
          itemExtent: 100,
          diameterRatio: 1.5,
          childDelegate: ListWheelChildBuilderDelegate(
              childCount: 20,
              builder: (ctx, index) {
                if (index % 4 == 0 && index != 0) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(0.8, 1),
                              colors: [
                                Color((math.Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                    .withOpacity(1.0),
                                Color((math.Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                    .withOpacity(1.0)
                              ]),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Artist Name',
                            style: theme.textTheme.displayMedium,
                          ),
                          subtitle: Text(
                            'Artist',
                            style: theme.textTheme.displaySmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                          leading: SizedBox(
                              height: 100,
                              width: 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/jackHarlow.jpeg'),
                                      fit: BoxFit.scaleDown),
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8, 1),
                                colors: [
                                  Color((math.Random().nextDouble() * 0xFFFFFF)
                                          .toInt())
                                      .withOpacity(1.0),
                                  Color((math.Random().nextDouble() * 0xFFFFFF)
                                          .toInt())
                                      .withOpacity(1.0)
                                ]),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Playlist',
                              style: theme.textTheme.displayMedium,
                            ),
                            subtitle: Text(
                              'PlayList . Username',
                              style: theme.textTheme.displaySmall!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            leading: SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                'assets/images/albumCover.jpg',
                              ),
                            ),
                          ),
                        ),
                      ));
                }
              }),
        ),
      ),
    );
  }
}
