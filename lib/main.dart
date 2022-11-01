import 'package:booksy_app/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booksy',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const BottomNavigationWidget(),
    );
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
    Text("biblioteca")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booksy'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_library),
              label: 'Biblioteca'
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
