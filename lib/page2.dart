import 'package:flutter/material.dart';

//! AnimatedDefaultTextStyle

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  bool _first = true;
  double _fontSize = 60;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Página 2', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _color,
                  fontWeight: FontWeight.bold,
                ),
                child: const Text('Flutter'),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _fontSize = _first ? 90 : 60;
                  _color = _first ? Colors.blue : Colors.red;
                  _first = !_first;
                });
              },
              child: const Text(
                "Switch",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver'),
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
