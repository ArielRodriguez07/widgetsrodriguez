import 'package:flutter/material.dart';
import 'package:widgetsrodriguez/page1.dart';
import 'package:widgetsrodriguez/page2.dart';
import 'package:widgetsrodriguez/page3.dart';
import 'package:widgetsrodriguez/page4.dart';
import 'package:widgetsrodriguez/page5.dart';
import 'package:widgetsrodriguez/page6.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> pages = [
    {
      'title': 'Página 1',
      'widget': Page1(),
      'icon': Icons.looks_one,
      'color': Colors.redAccent
    },
    {
      'title': 'Página 2',
      'widget': Page2(),
      'icon': Icons.looks_two,
      'color': Colors.orangeAccent
    },
    {
      'title': 'Página 3',
      'widget': Page3(),
      'icon': Icons.looks_3,
      'color': Colors.amber
    },
    {
      'title': 'Página 4',
      'widget': Page4(),
      'icon': Icons.looks_4,
      'color': Colors.lightGreen
    },
    {
      'title': 'Página 5',
      'widget': Page5(),
      'icon': Icons.looks_5,
      'color': Colors.blueAccent
    },
    {
      'title': 'Página 6',
      'widget': Page6(),
      'icon': Icons.looks_6,
      'color': Colors.purpleAccent
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Página Principal',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: pages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final page = pages[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => page['widget']),
                );
              },
              child: Card(
                color: page['color'],
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        page['icon'],
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        page['title'],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
