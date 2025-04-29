import 'dart:ui';
import 'package:flutter/material.dart';

//! BackdropFilter

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Página 5', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: <Widget>[
          Text(
            '0' * 10000,
            style: const TextStyle(
              color: Colors.green,
            ),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 250,
                  child: const Text('Blur'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
