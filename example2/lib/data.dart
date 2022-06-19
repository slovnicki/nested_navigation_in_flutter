class Book {
  const Book({
    required this.id,
    required this.title,
    required this.author,
  });

  final int id;
  final String title;
  final String author;
}

const List<Book> books = [
  Book(
    id: 1,
    title: 'Stranger in a Strange Land',
    author: 'Robert A. Heinlein',
  ),
  Book(
    id: 2,
    title: 'Foundation',
    author: 'Isaac Asimov',
  ),
  Book(
    id: 3,
    title: 'Fahrenheit 451',
    author: 'Ray Bradbury',
  ),
  Book(
    id: 4,
    title: 'Stranger in a Strange Land',
    author: 'Robert A. Heinlein',
  ),
  Book(
    id: 5,
    title: 'Foundation',
    author: 'Isaac Asimov',
  ),
  Book(
    id: 6,
    title: 'Fahrenheit 451',
    author: 'Ray Bradbury',
  ),
  Book(
    id: 7,
    title: 'Stranger in a Strange Land',
    author: 'Robert A. Heinlein',
  ),
  Book(
    id: 8,
    title: 'Foundation',
    author: 'Isaac Asimov',
  ),
  Book(
    id: 9,
    title: 'Fahrenheit 451',
    author: 'Ray Bradbury',
  ),
];

Book? findBook(String? id) {
  try {
    return books.firstWhere((book) => book.id.toString() == id);
  } catch (e) {
    return null;
  }
}

class Article {
  const Article({
    required this.id,
    required this.title,
    required this.author,
  });

  final int id;
  final String title;
  final String author;
}

const List<Article> articles = [
  Article(
    id: 1,
    title: 'Learning Flutter’s new navigation and routing system',
    author: 'John Ryan',
  ),
  Article(
    id: 2,
    title: 'Explaining Flutter Nav 2.0 and Beamer',
    author: 'Toby Lewis',
  ),
  Article(
    id: 3,
    title: 'Flutter Navigator 2.0 for Authentication and Bootstrapping',
    author: 'Cagatay Ulusoy',
  ),
];

Article? findArticle(String? id) {
  try {
    return articles.firstWhere((article) => article.id.toString() == id);
  } catch (e) {
    return null;
  }
}
