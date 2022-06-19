import 'dart:math' as math;
import 'package:beamer/beamer.dart';
import 'package:example2/data.dart';
import 'package:example2/simple_screens.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  AppScreenState createState() => AppScreenState();
}

class AppScreenState extends State<AppScreen> {
  final beamerDelegates = [
    BeamerDelegate(
      initialPath: '/books',
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/books': (_, __, ___) => const BooksScreen(),
          '/books/:bookId': (_, state, __) => BookDetailsScreen(
                book: findBook(state.pathParameters['bookId']),
              ),
        },
      ),
    ),
    BeamerDelegate(
      initialPath: '/articles',
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/articles': (_, __, ___) => const ArticlesScreen(),
          '/articles/:articleId': (_, state, __) => ArticleDetailsScreen(
                article: findArticle(state.pathParameters['articleId']),
              ),
        },
      ),
    ),
    BeamerDelegate(
      initialPath: '/black',
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/black': (_, __, ___) => const SharedScreen(color: Colors.black),
          '/black/:anything': (_, __, ___) =>
              const SharedDetailsScreen(color: Colors.black),
        },
      ),
    ),
    BeamerDelegate(
      initialPath: '/yellow',
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/yellow': (_, __, ___) => const SharedScreen(color: Colors.yellow),
          '/yellow/:anything': (_, __, ___) =>
              const SharedDetailsScreen(color: Colors.yellow),
        },
      ),
    ),
    BeamerDelegate(
      initialPath: '/red',
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/red': (_, __, ___) => const SharedScreen(color: Colors.red),
          '/red/:anything': (_, __, ___) =>
              const SharedDetailsScreen(color: Colors.red),
        },
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ContainerWrapper(
                width: 400,
                height: 600,
                child: Beamer(routerDelegate: beamerDelegates[0]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ContainerWrapper(
                width: 400,
                height: 220,
                child: Beamer(routerDelegate: beamerDelegates[1]),
              ),
            ),
          ),
          Positioned(
            left: 300,
            bottom: 48,
            child: Transform.rotate(
              angle: 0.88 * math.pi,
              child: ContainerWrapper(
                width: 256,
                height: 400,
                child: Beamer(
                  routerDelegate: beamerDelegates[2],
                ),
              ),
            ),
          ),
          Positioned(
            left: 480,
            top: 64,
            child: ContainerWrapper(
              width: 168,
              height: 240,
              child: Beamer(
                routerDelegate: beamerDelegates[3],
              ),
            ),
          ),
          Positioned(
            right: 96,
            top: 48,
            child: Transform.rotate(
              angle: 1 / 6 * math.pi,
              child: ContainerWrapper(
                width: 240,
                height: 420,
                child: Beamer(
                  routerDelegate: beamerDelegates[4],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerWrapper extends StatelessWidget {
  const ContainerWrapper({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(width: 1),
      ),
      child: child,
    );
  }
}
