import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos San Salvador'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Descubre nuestra gran variedad de productos en nuestro catálogo digital.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            _buildProductCard(
              'Aceite Mixto Bote 175 ML',
              'Bote en lata.\nCaja con: 12 piezas.\nMedidas de caja: Largo 21.5 cm Ancho 16.0 cm Alto 13.0 cm',
            ),
            _buildProductCard(
              'Aceite Mixto Bote 350 ML',
              'Bote en lata.\nCaja con: 12 piezas.\nMedidas de caja: Largo 28.0 cm Ancho 20.0 cm Alto 16.0 cm',
            ),
            _buildProductCard(
              'Aceite Mixto Bote 775 ML',
              'Bote en lata.\nCaja con: 12 piezas.\nMedidas de caja: Largo 34.8 cm Ancho 26.0 cm Alto 19.7 cm',
            ),
            _buildProductCard(
              'Aceite Mixto 45 ML',
              'Tira con: 12 piezas.\nCaja con: 20 tiras\nMedidas de caja: Largo 36.4 cm Ancho 30.0 cm Alto 21.0 cm',
            ),
            _buildProductCard(
              'Aceite Mixto 250 ML',
              'Botella tipo cristal\nCaja con: 12 piezas.\nMedidas de caja: Largo 21.6 cm Ancho 16.2 cm Alto 14.7 cm',
            ),
            _buildProductCard(
              'Aceite Mixto 750 ML',
              'Botella tipo cristal\nCaja con: 12 piezas.\nMedidas de caja: Largo 24.5 cm Ancho 22.5 cm Alto 24.5 cm',
            ),
            _buildProductCard(
              'Aceite Puro 45 ML',
              'Tira con: 12 piezas.\nCaja con: 20 tiras\nMedidas de caja: Largo 36.4 cm Ancho 30.0 cm Alto 21.0 cm',
            ),
            _buildProductCard(
              'Aceite Puro 250 ML',
              'Botella tipo cristal\nCaja con: 12 piezas\nMedidas de caja: Largo 21.6 cm Ancho 16.2 cm Alto 14.7 cm',
            ),
            _buildProductCard(
              'Aceite Puro 750 ML',
              'Botella tipo cristal\nCaja con: 12 piezas.\nMedidas de caja: Largo 24.5 cm Ancho 22.5 cm Alto 24.5 cm',
            ),
            _buildProductCard(
              'Vainilla 45 ML',
              'Tira con: 12 piezas.\nCaja con: 20 tiras\nMedidas de caja: Largo 36.4 cm Ancho 30.0.2 cm Alto 21.0 cm',
            ),
            _buildProductCard(
              'Vainilla 125 ML',
              'Tira con: 6 garrafas\nCaja con: 10 tiras\nMedidas de caja: Largo 29.5 cm Ancho 23.2 cm Alto 20.6 cm',
            ),
            _buildProductCard(
              'Vainilla 250 ML',
              'Garrafa\nCaja con: 12 piezas.\nMedidas de caja: Largo 30.1 cm Ancho 24.5 cm Alto 12.8 cm',
            ),
            _buildProductCard(
              'Vainilla 500 ML',
              'Garrafa\nCaja con: 12 piezas.\nMedidas de caja: Largo 30.1 cm Ancho 23.0 cm Alto 15.3 cm',
            ),
            _buildProductCard(
              'Vainilla 1 Litro',
              'Garrafa\nCaja con: 12 piezas.\nMedidas de caja: Largo 37.0 cm Ancho 27.5 cm Alto 19.0 cm',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String title, String description) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18,),
            ),
          const  SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
