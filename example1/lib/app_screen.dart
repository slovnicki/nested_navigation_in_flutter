import 'package:beamer/beamer.dart';
import 'package:example1/data.dart';
import 'package:example1/simple_screens.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  AppScreenState createState() => AppScreenState();
}

class AppScreenState extends State<AppScreen> {
  late int currentIndex;

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
        )),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    currentIndex = uriString.contains('books') ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          Beamer(routerDelegate: beamerDelegates[0]),
          Beamer(routerDelegate: beamerDelegates[1]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(label: 'Books', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'Articles', icon: Icon(Icons.article)),
        ],
        onTap: (index) {
          if (index != currentIndex) {
            setState(() => currentIndex = index);
            beamerDelegates[currentIndex].update(rebuild: false);
          }
        },
      ),
    );
  }
}
