
import 'package:booksy_app/model/Book.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  final List<Book> _books= const [
    Book(1, "El señor de los anillos", "J.R.R. Tolkien", "Un anillo para gobernarlos a todos","assets/images/book1.jpg"),
    Book(2, "El principito", "Antoine de Saint-Exupéry", "Un pequeño príncipe que viaja por el universo","assets/images/book2.jpg"),


  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: _books.length+2,
          itemBuilder: (context,index){
            if(index==0){
              return const HeaderWidget();
            }
            if (index==1) {
              return const ListItemHeader();
            }
            return ListItemBook(_books[index-2]);
       },
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget{
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/images/header.jpg',
        ));
  }
}


class ListItemHeader extends StatelessWidget{
  const ListItemHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left: 5),
      child: const Text("Ultimos libros",style: TextStyle(fontSize: 20),),
    );
  }
}

class ListItemBook extends StatelessWidget{
  final Book _book;
  const ListItemBook(this._book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 170,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: (){
            _openBookDetail(context,_book);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10,right:10),
                    child: Image.asset(_book.coverUrl),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_book.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 5,),
                        Text(_book.author,
                          style: Theme.of(context)
                            .textTheme
                            .subtitle2),
                        const SizedBox(height: 15),
                        Text(_book.description,maxLines: 4,overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2,
                        ),
                      ],
                    ),
                  )
                ],
            ),
          ),
        ),
      ),
    );
  }

  void _openBookDetail(BuildContext context, Book book) {

  }
}