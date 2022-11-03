import 'package:booksy_app/book_details/book_details_screen.dart';
import 'package:booksy_app/model/Book.dart';
import 'package:flutter/material.dart';

class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({Key? key}) : super(key: key);

  final List<Book> _books= const [
    Book(1, "El señor de los anillos", "J.R.R. Tolkien", "Un anillo para gobernarlos a todos","assets/images/book1.jpg"),
    Book(2, "El principito", "Antoine de Saint-Exupéry", "Un pequeño príncipe que viaja por el universo","assets/images/book2.jpg"),
    Book(3, "Sociedad Da Caveira De Cristal", "Andrea Del Fuego", "Uma sociedad que va a procura da realidad","assets/images/book3.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    if (_books.isEmpty) {
      return Center(
        child: Text('No hay libros en tu estante',
        style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
      ),
      );
    }
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7
          ),
          itemCount: _books.length,
          itemBuilder: (context,index){
          return BookCoverItem(_books[index]);
          }),
    );
  }
}

class BookCoverItem extends StatelessWidget{
  final Book _book;
  const BookCoverItem(this._book,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
        child: Ink.image(
          fit: BoxFit.fill,image: AssetImage(_book.coverUrl)),
    );
  }

}