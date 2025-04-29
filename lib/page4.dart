import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Página 4', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        // Centrado del contenido
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
          crossAxisAlignment: CrossAxisAlignment.center, // Centrado horizontal
          children: <Widget>[
            // Animación con AnimatedSwitcher
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                '$_count',
                style: const TextStyle(fontSize: 40),
                key: ValueKey(_count), // Necesario para la transición
              ),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                    scale: animation, child: child); // Animación de escala
              },
            ),
            SizedBox(height: 20),
            // Botón para aumentar el contador
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                setState(() {
                  _count += 1; // Incrementar el contador
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Color de fondo del botón
                foregroundColor: Colors.white, // Color del texto
              ),
            ),
            SizedBox(height: 20),

            // Botón de regresar
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_back),
              label: Text('Volver'),
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
