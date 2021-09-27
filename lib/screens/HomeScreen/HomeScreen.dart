import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../route/components/CustomDrawer.dart';
import './Home.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    Home(),
    Container(child: Center(child: Text('Add'))),
    MenuDrawer()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_justify_outlined),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
