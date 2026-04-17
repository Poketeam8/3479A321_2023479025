import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acerca de')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Buscaminas App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Desarrollado por: Martin Alvarez, Estudiante de Ingeniería en Videojuegos en la Universidad de Talca.',
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
