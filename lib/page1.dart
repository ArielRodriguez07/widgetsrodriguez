import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  double _leftPosition = 0;
  double _topPosition = 0;

  // Cambia la posición del logo aleatoriamente dentro de los límites
  void _moveLogo() {
    setState(() {
      // Tamaño del logo
      double logoSize = 60.0;

      // Tamaño del contenedor (debe ser suficiente para que el logo se mueva dentro de la pantalla)
      double containerWidth = 300.0; // Ancho del contenedor
      double containerHeight = 300.0; // Alto del contenedor

      // Calculamos las posiciones aleatorias, asegurándonos de que el logo no salga de la pantalla
      _leftPosition = (containerWidth - logoSize) *
              (1 - 2 * (new DateTime.now().millisecondsSinceEpoch % 2)) +
          20;
      _topPosition = (containerHeight - logoSize) *
              (1 - 2 * (new DateTime.now().millisecondsSinceEpoch % 2)) +
          20;

      // Limitar las posiciones para que no salgan fuera de la pantalla
      if (_leftPosition < 0) _leftPosition = 0;
      if (_topPosition < 0) _topPosition = 0;
      if (_leftPosition > containerWidth - logoSize)
        _leftPosition = containerWidth - logoSize;
      if (_topPosition > containerHeight - logoSize)
        _topPosition = containerHeight - logoSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Página 1', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _moveLogo, // Mueve el logo al tocarlo
            child: Container(
              height: 300.0, // Aumentamos la altura
              width: double.infinity, // Ancho completo
              color: Colors.blueGrey,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500), // Animación suave
                    left: _leftPosition,
                    top: _topPosition,
                    child: const FlutterLogo(
                      size: 60,
                    ),
                  ),
                ],
              ),
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
    );
  }
}
