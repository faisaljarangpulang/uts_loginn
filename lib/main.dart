import 'package:layout/book.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Buku Sederhana',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/detail': (context) => BookDetailScreen(),
        // Rute lainnya bisa ditambahkan di sini, seperti /about atau /cart
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'The Great Gatsby',
      price: 90000,
      image: 'assets/images/book1.png',
      description: 'sejarah.',
    ),
    Book(
      title: '1984',
      price: 85000,
      image: 'assets/images/book2.jpg',
      description: 'buku apa aja.',
    ),
    Book(
      title: 'Moby Dick',
      price: 120000,
      image: 'assets/images/book3.jpeg',
      description: 'buku limited.',
    ),
    Book(
      title: 'War and Peace',
      price: 150000,
      image: 'assets/images/book4.png',
      description: 'boom nagasaki',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Image.asset(
                book.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(book.title),
              subtitle: Text('Rp ${book.price}'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.pushNamed(context, '/detail', arguments: book);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


class BookDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Book book = ModalRoute.of(context)!.settings.arguments as Book;

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              book.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Rp ${book.price}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              book.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


class Book {
  final String title;
  final double price;
  final String image;
  final String description;

  Book({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
  });
}
