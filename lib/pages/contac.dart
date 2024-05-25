import 'package:flutter/material.dart';

class ContactenosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contáctenos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contáctenos',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            const Text(
              '¡Estamos aquí para ayudarte!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Correo Electrónico'),
              subtitle: Text('contacto@sansalvador.com'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Teléfono'),
              subtitle: Text('52 567 48 418'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Dirección'),
              subtitle: Text('Avenida Principal 123, Ciudad de México, México'),
              onTap: () {
                // Acción al hacer clic en la dirección
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Síguenos en nuestras redes sociales:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.message_sharp),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.facebook_sharp),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
