import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  double padValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Página 3', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        // Centrar todo el contenido
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los elementos verticalmente
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centra los elementos horizontalmente
          children: <Widget>[
            // Botón para cambiar el padding
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .orangeAccent, // Aquí cambiamos 'primary' por 'backgroundColor'
              ),
              child: const Text('Change padding'),
              onPressed: () {
                setState(() {
                  padValue = padValue == 0.0 ? 100.0 : 0.0; // Cambia el padding
                });
              },
            ),
            // Mostrar el valor actual del padding
            Text('Padding = $padValue'),
            // Contenedor con animación de padding
            AnimatedPadding(
              padding: EdgeInsets.all(padValue),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                color: Colors.orangeAccent,
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
