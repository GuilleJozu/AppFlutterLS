import 'package:flutter/material.dart';

class NosotrosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nosotros'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nosotros',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Somos una empresa dedicada a la elaboración y envasado de Aceite de Oliva en diversas presentaciones, destacada por su sabor tradicional, suavemente herbal, que armoniza a la perfección con las comidas clásicas de la gastronomía mexicana.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Molino de aceitunas',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Nuestra receta. Gracias al uso de olivas de alta calidad y a nuestra meticulosa preparación tradicional, creamos un aceite que ha sido el preferido de las familias mexicanas durante más de 50 años.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Nuestro proceso exclusivo asegura un sabor suave, especialmente diseñado para complacer los paladares mexicanos, sin sacrificar sus propiedades nutritivas. Todo ello, a un precio altamente competitivo, para que cada hogar pueda disfrutar de San Salvador.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Una presentación para cada mesa',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ofrecemos una amplia variedad de presentaciones que se adaptan a las necesidades de cualquier consumidor, tanto en términos de mililitros como de precio. Desde nuestro tradicional bote, que destaca por su diseño en los estantes, hasta botellas tipo cristal en diferentes medidas y nuestra línea económica de 45 ml en tiras de 12 piezas, perfecta para pequeños negocios.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Recomendaciones',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        title: const Text('Bote en metal de 750 ml'),
                        subtitle: const Text('Descripción del producto'),
                        onTap: () {},
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        title: const Text('Botellas de Aceite de Oliva'),
                        subtitle: const Text('Descripción del producto'),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
