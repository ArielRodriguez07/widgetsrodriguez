import 'package:flutter/material.dart';

//! AnimatedSwitcher

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Página 4', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                '$_count',
                style: const TextStyle(fontSize: 40),
                key: ValueKey(_count),
              ),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
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
