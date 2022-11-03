import 'package:booksy_app/model/Book.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget{
  final Book _book;
  const BookDetailsScreen(this._book,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle Libro"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookCoverWidget(_book.coverUrl),
            BookInfoWidget(_book.title,_book.author,_book.description),
            ElevatedButton(onPressed: (){
              //agregar accion para el libro
            },
            child: const Text("Accion"))
          ],
        ),
      ),
    );
  }
}

class BookInfoWidget extends StatelessWidget{
  final String _title;
  final String _author;
  final String _description;

  const BookInfoWidget(this._title,this._author,this._description,{Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(children: [
          Text(_title,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Text(
              _author,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          Text(
              _description,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 16)
          ),
      ]),
    );
  }
}

class BookCoverWidget extends StatelessWidget{
  final String _coverUrl;
  const BookCoverWidget(this._coverUrl,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      width: 230,
      child: Image.asset(_coverUrl),
      decoration: BoxDecoration(boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 20,
          )
      ]),
    );
  }
}