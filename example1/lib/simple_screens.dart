import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:example1/data.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: ListView(
        children: books
            .map(
              (book) => ListTile(
                title: Text(book.title),
                subtitle: Text(book.author),
                onTap: () => context.beamToNamed('/books/${book.id}'),
              ),
            )
            .toList(),
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key, required this.book}) : super(key: key);

  final Book? book;

  @override
  Widget build(BuildContext context) {
    if (book == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Not found'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(book!.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Author: ${book!.author}'),
      ),
    );
  }
}

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Articles')),
      body: ListView(
        children: articles
            .map(
              (article) => ListTile(
                title: Text(article.title),
                subtitle: Text(article.author),
                onTap: () => context.beamToNamed('/articles/${article.id}'),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({Key? key, required this.article})
      : super(key: key);

  final Article? article;

  @override
  Widget build(BuildContext context) {
    if (article == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Not found'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(article!.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Author: ${article!.author}'),
      ),
    );
  }
}
