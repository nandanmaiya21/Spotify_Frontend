import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:spotify/widgets/list_tiles.dart';
import 'widgets/Pages/front_page.dart';
import 'package:intl/intl.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'widgets/Pages/search_page.dart';
import 'widgets/Pages/yourLibrary.dart';
import 'dart:math' as math;
import 'widgets/container_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String getDay() {
      var format = DateFormat.H();
      int dateString = int.tryParse(format.format(DateTime.now())) ?? 0;

      if (dateString >= 6 && dateString <= 12) {
        return 'Good morning';
      } else if (dateString > 12 && dateString <= 15) {
        return 'Good afternoon';
      } else if (dateString > 15 && dateString <= 19) {
        return 'Good evening';
      } else {
        return 'Goodnight';
      }
    }

    String title = getDay();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      theme: ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontFamily: 'Gotham Circular Medium',
            color: Colors.white,
            fontSize: 12,
          ),
          displayLarge: TextStyle(
              fontFamily: 'Gotham Circular',
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold),
          displaySmall: TextStyle(
              fontFamily: 'Gotham Circular Light',
              color: Colors.white,
              fontSize: 12),
        ),
        primarySwatch:
            generateMaterialColor(color: Color.fromRGBO(25, 20, 20, 1)),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: Color.fromRGBO(25, 20, 20, 1),
          primary: Color.fromRGBO(30, 215, 96, 1),
          secondary: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor:
                const MaterialStatePropertyAll(Color.fromRGBO(30, 215, 96, 1)),
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade800),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomSelectedIndex = 0;
  bool istapped = false;
  int activeIndex = 0;

  PageController controller = PageController(initialPage: 0);

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
      istapped = true;
    });
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Padding(
              child: Icon(
                Icons.home,
              ),
              padding: EdgeInsets.all(8)),
          label: 'Home'),
      BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          label: 'Search'),
      BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.library_music),
          ),
          label: 'Your Library'),
      BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.workspace_premium_rounded),
          ),
          label: 'Premium')
    ];
  }

  List<Color> listColor = [];

  void selectColor() {
    for (int i = 0; i < 59; i++) {
      listColor.add(Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0));
    }
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      controller.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  List<String> listOfPremiumFeat = [
    'Ad-free music listening',
    'Play any song',
    'Unlimited skips',
    'Offline listening',
    'High audio quality'
  ];
  List<String> listOfFreeFeat = [
    'Ad breaks',
    'Play in shuffle',
    '6 skips per hour',
    'Streaming only',
    'Basic audio quality'
  ];

  Container buildContainer(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'FREE',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: index == 0 ? 10 : 5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '${listOfFreeFeat[index]}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14, height: 1.2),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(6), bottomRight: Radius.circular(6)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topLeft,
                colors: [Colors.green.shade500, Colors.green.shade900]),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'PREMIUM',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '${listOfPremiumFeat[index]}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14, height: 1.2),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    selectColor();
    final theme = Theme.of(context);
    AppBar appBar =
        spotifyAppBar(Theme.of(context), context, bottomSelectedIndex);

    if (istapped) {
      appBar = spotifyAppBar(Theme.of(context), context, bottomSelectedIndex);
      istapped = false;
    }
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: bottomSelectedIndex != 3 ? appBar : null,
      body: PageView(
        onPageChanged: (index) {
          pageChanged(index);
        },
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          FontPage(theme: theme),
          SearchPage(theme: theme, appBar: appBar, listColor: listColor),
          YourLibrary(theme: theme),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // title: ListTile(
                //   title: Text(
                //     '3 months of Premium for free',
                //     style: theme.textTheme.displayLarge,
                //   ),
                //   subtitle: Text('NEW OPPORTUNITY'),
                // ),

                expandedHeight: 500,
                floating: true,
                pinned: true,
                snap: false,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.purple.shade600, Colors.black]),
                  ),
                  child: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 20,
                                width: 124,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius: BorderRadius.circular(2)),
                                padding: EdgeInsets.all(2),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 9,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      ' NEW OPPORTUNITY',
                                      style: theme.textTheme.displaySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '3 months of Premium for free',
                                style: theme.textTheme.displayLarge,
                              ),
                            ]),
                      ),
                      background: Image.asset(
                        'assets/images/spotifypremium.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    List<Widget> l = [
                      Container(
                        // color: Colors.blue,
                        height: 200,
                        padding: EdgeInsets.only(left: 15, right: 15, top: 30),
                        child: Column(
                          children: [
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                  viewportFraction: 0.8,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  },
                                  height: 100,
                                  enlargeCenterPage: true,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  enableInfiniteScroll: false),
                              itemCount: 5,
                              itemBuilder: (context, index, realIndex) {
                                return buildContainer(index);
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            buildIndicator()
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'You can\'t upgrade to Premium in the app. We know, it\'s not ideal.',
                              style: theme.textTheme.displaySmall!.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(8)),
                            width: MediaQuery.of(context).size.width - 30,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 8, bottom: 8),
                                    child: Text(
                                      'Spotify Plan',
                                      style: theme.textTheme.displayMedium!
                                          .copyWith(fontSize: 19),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      'CURRENT PLAN',
                                      style: theme.textTheme.displaySmall!
                                          .copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30.0, left: 15),
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Text(
                                                'FREE FOR 3 MONTHS',
                                                style: theme
                                                    .textTheme.displayMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 12),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Container(
                                                child: Text(
                                              'Premium Plan',
                                              style: theme
                                                  .textTheme.displayLarge!
                                                  .copyWith(fontSize: 18),
                                            )),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 20, left: 40, right: 40),
                                        child: Text(
                                          '3 months of Premium for free .  ext Text Text Text Text Text Text Text Text Text Text Text Text Text Text  Text Text Text Text Text Text Text .',
                                          style: theme.textTheme.displaySmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.3),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(15),
                                  height: 200,
                                  width: MediaQuery.of(context).size.width - 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Colors.green.shade500,
                                        Colors.green.shade900
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30.0, left: 15),
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Text(
                                                'FREE FOR 1 MONTH',
                                                style: theme
                                                    .textTheme.displayMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 12),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Container(
                                                child: Text(
                                              'Premium Plan',
                                              style: theme
                                                  .textTheme.displayLarge!
                                                  .copyWith(fontSize: 18),
                                            )),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 20, left: 40, right: 40),
                                        child: Text(
                                          '3 months of Premium for free .  ext Text Text Text Text Text Text Text Text Text Text Text Text Text Text  Text Text Text Text Text Text Text .',
                                          style: theme.textTheme.displaySmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.3),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(15),
                                  height: 200,
                                  width: MediaQuery.of(context).size.width - 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Colors.blue.shade500,
                                        Colors.blue.shade900
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30.0, left: 15),
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Text(
                                                'FREE FOR 1 MONTHS',
                                                style: theme
                                                    .textTheme.displayMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 12),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Container(
                                                child: Text(
                                              'Premium Plan',
                                              style: theme
                                                  .textTheme.displayLarge!
                                                  .copyWith(fontSize: 18),
                                            )),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 20, left: 40, right: 40),
                                        child: Text(
                                          '3 months of Premium for free .  ext Text Text Text Text Text Text Text Text Text Text Text Text Text Text  Text Text Text Text Text Text Text .',
                                          style: theme.textTheme.displaySmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.3),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(15),
                                  height: 200,
                                  width: MediaQuery.of(context).size.width - 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Colors.purple.shade500,
                                        Colors.purple.shade900
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30.0, left: 15),
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Text(
                                                'FREE FOR 1 MONTHS',
                                                style: theme
                                                    .textTheme.displayMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 12),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Container(
                                                child: Text(
                                              'Premium Plan',
                                              style: theme
                                                  .textTheme.displayLarge!
                                                  .copyWith(fontSize: 18),
                                            )),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 20, left: 40, right: 40),
                                        child: Text(
                                          '3 months of Premium for free .  ext Text Text Text Text Text Text Text Text Text Text Text Text Text Text  Text Text Text Text Text Text Text .',
                                          style: theme.textTheme.displaySmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.3),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(15),
                                  height: 200,
                                  width: MediaQuery.of(context).size.width - 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Colors.amber.shade500,
                                        Colors.amber.shade900
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ];

                    return l[index];
                  },
                  childCount: 2,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
              fontFamily: 'Gotham Circular Light',
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold),
          backgroundColor: Colors.black.withOpacity(0.2),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: theme.colorScheme.primary,
          unselectedItemColor: theme.colorScheme.secondary,
          elevation: 0,
          iconSize: 25,
          currentIndex: bottomSelectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          items: buildBottomNavBarItems(),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ScrollingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: Colors.grey,
            activeDotColor: Colors.white),
        activeIndex: activeIndex,
        count: 5,
      );
  AppBar spotifyAppBar(
      ThemeData theme, BuildContext context, int selectedpage) {
    if (selectedpage == 0) {
      return AppBar(
        elevation: null,
        toolbarHeight: 100,
        backgroundColor: theme.colorScheme.background,
        title: Text(
          widget.title,
          style: theme.textTheme.displayLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 25,
            icon: Icon(Icons.notifications_outlined,
                size: 25, color: theme.colorScheme.secondary),
          ),
          SizedBox(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? 10
                : 20,
          ),
          IconButton(
            onPressed: () {},
            splashRadius: 25,
            icon: Icon(Icons.access_time_outlined,
                size: 25, color: theme.colorScheme.secondary),
          ),
          SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 10
                  : 20),
          IconButton(
            onPressed: () {},
            splashRadius: 25,
            icon: Icon(Icons.settings_outlined,
                size: 25, color: theme.colorScheme.secondary),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Music',
                    style: theme.textTheme.displayMedium,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Podcasts & Show',
                    style: theme.textTheme.displayMedium,
                  )),
            ),
          ]),
        ),
      );
    } else if (selectedpage == 1) {
      return AppBar(
        elevation: null,
        toolbarHeight:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? 150
                : 140,
        backgroundColor: theme.colorScheme.background,
        title: Text(
          'Search',
          style: theme.textTheme.displayLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 30,
            ),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: theme.colorScheme.secondary),
                    height: 40,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),
                        Text(
                          'What do you want to listen to?',
                          style: theme.textTheme.displayMedium!
                              .copyWith(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                  child: Text(
                    'Browse all',
                    style: theme.textTheme.displayLarge!.copyWith(fontSize: 15),
                  ),
                )
              ],
            )),
      );
    } else if (selectedpage == 2) {
      return AppBar(
        elevation: null,
        toolbarHeight: 150,
        backgroundColor: theme.colorScheme.background,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
                radius: 20,
              ),
            ),
            Text(
              'Your Library',
              style: theme.textTheme.displayLarge!.copyWith(fontSize: 20),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 25,
            icon: Icon(Icons.search,
                size: 25, color: theme.colorScheme.secondary),
          ),
          SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 5
                  : 20),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              splashRadius: 25,
              icon:
                  Icon(Icons.add, size: 25, color: theme.colorScheme.secondary),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Playlists',
                    style: theme.textTheme.displayMedium,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Albums',
                    style: theme.textTheme.displayMedium,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Artists',
                    style: theme.textTheme.displayMedium,
                  )),
            ),
          ]),
        ),
      );
    } else
      return AppBar();
  }
}
