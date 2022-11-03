import 'package:booksy_app/bookshelf/bookshelf_screen.dart';
import 'package:booksy_app/categories/categories_screen.dart';
import 'package:booksy_app/home/home_screen.dart';
import 'package:booksy_app/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookshelfBloc(BookshelfState([])),
    child: MaterialApp(
      title: 'Booksy',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const BottomNavigationWidget(),
      ));
  }
}

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectIndex = 0;

  static const List<Widget> _sections=[
    HomeScreen(),
    CategoriesScreen(),
    BookshelfScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booksy'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_library),
              label: 'Biblioteca',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories),
              label: 'Mi Estante',
          ),
        ],
        currentIndex: _selectIndex,
        onTap: _onItemTapped,
      ),
      body: _sections[_selectIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
