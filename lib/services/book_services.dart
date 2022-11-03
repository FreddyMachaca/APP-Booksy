import 'package:booksy_app/model/Book.dart';

class BooksService{

  static const List<Book> books=[
    Book(1, "El señor de los anillos", "J.R.R. Tolkien", "Un anillo para gobernarlos a todos en el universo de hobbit","assets/images/book1.jpg"),
    Book(2, "El principito", "Antoine de Saint-Exupéry", "Un pequeño príncipe que viaja por el universo","assets/images/book2.jpg"),
    Book(3, "El principito", "Antoine de Saint-Exupéry", "Un pequeño príncipe que viaja por el universo","assets/images/book3.jpg"),
    Book(4, "El principito", "Antoine de Saint-Exupéry", "Un pequeño príncipe que viaja por el universo","assets/images/book4.jpg"),
    Book(5, "El principito", "Antoine de Saint-Exupéry", "Un pequeño príncipe que viaja por el universo","assets/images/book5.jpg"),
  ];

  Future <List<Book>> getLastBook() async{
      //var books= await api.getBooks();
    return Future.delayed(const Duration(seconds: 2))
        .then((value) => Future.value(books.sublist(0,3)));
  }

  Future <Book> getBook(int bookId) async{
    return Future.delayed(const Duration(seconds: 2))
        .then((value) => Future.value(books.firstWhere((bookElement) => bookElement.id==bookId)));
  }

}