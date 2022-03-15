import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white54)),
        scaffoldBackgroundColor: const Color(0xFF030303),
        primaryColor: const Color(0xFFe6e6e7),
        primaryColorLight: Colors.white70,
        primaryColorDark: const Color(0xFF1d1e21),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF030303)),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        Header(),
        SizedBox(
          height: 30,
        ),
        SelectGenre(),
        AppHeader(),
      ],
    ));
  }
}

class SelectGenre extends StatefulWidget {
  const SelectGenre({Key? key}) : super(key: key);

  @override
  State<SelectGenre> createState() => _SelectGenreState();
}

class _SelectGenreState extends State<SelectGenre> {
  String curPosition = 'left';
  String left = 'left';
  String right = 'right';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 502,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => setState(() => curPosition = left),
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    color: left == curPosition
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColorDark,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Column(children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Icon(
                    Icons.flutter_dash_outlined,
                    size: 100,
                    color: left == curPosition
                        ? Theme.of(context).primaryColorDark
                        : Theme.of(context).primaryColorLight,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Мультфильмы',
                    style: TextStyle(
                        color: left == curPosition
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            GestureDetector(
              onTap: () => setState(() => curPosition = right),
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    color: right == curPosition
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColorDark,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Icon(
                    Icons.sports_esports_outlined,
                    size: 100,
                    color: right == curPosition
                        ? Theme.of(context).primaryColorDark
                        : Theme.of(context).primaryColorLight,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Игры',
                    style: TextStyle(
                        color: right == curPosition
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String getSystemTime() {
    DateFormat dateFormat = DateFormat("HH:mm");
    DateTime now = DateTime.now();
    return dateFormat.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Киоск',
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          Row(
            children: [
              const Icon(
                Icons.settings_outlined,
                size: 20,
                color: Colors.white54,
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.more_vert,
                size: 20,
                color: Colors.white38,
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.wb_sunny_outlined,
                size: 20,
                color: Colors.white54,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                '-40',
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.more_vert,
                size: 20,
                color: Colors.white38,
              ),
              const SizedBox(
                width: 20,
              ),
              TimerBuilder.periodic(const Duration(seconds: 1),
                  builder: (context) {
                return Text(
                  getSystemTime(),
                  style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                );
              }),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '16 декабря',
                    style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  Text(
                    'среда',
                    style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class AppHeader extends StatefulWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  int selectedItemMenu = 0;
  final List<String> itemMenu = [
    'Главная',
    'Навигатор',
    'Библиотека',
    'Платные подписки',
    'Поиск'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 64,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/logo.svg'),
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: itemMenu.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedItemMenu = index),
                      child: Text(
                        itemMenu[index],
                        style: TextStyle(
                            color: index == selectedItemMenu
                                ? Colors.white
                                : Colors.white54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.cast,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage('assets/images/ice.jpg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
