import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/tradicion.dart';
import 'contac.dart';
import 'produc.dart';

class EmpacadoraSanSalvadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Empacadora San Salvador',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 16, 85, 3),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Tradición desde 1950'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NosotrosPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('Productos'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contáctanos'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactenosPage()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Empacadora San Salvador desde 1950',
                style: TextStyle(fontSize: 26),
              ),
              const SizedBox(height: 16),
              const Image(
                image: AssetImage('images/portada.png'),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Horario de atención | Lunes-Viernes de 9:00 a 18:00',
                  style: TextStyle(
                      fontSize: 16,
                      backgroundColor: Color.fromARGB(255, 209, 239, 207),
                      wordSpacing: Checkbox.width,
                      letterSpacing: 1.00),
                ),
              ),
              const SizedBox(height: 32),
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  _buildGridTile(
                    'Aceite Puro',
                    'El tradicional de San Salvador.',
                    'images/aceitePuro.png',
                  ),
                  _buildGridTile(
                    'Aceite Mixto',
                    'Descubre el clásico sabor al mejor precio.',
                    'images/aceiteMixto.webp',
                  ),
                  _buildGridTile(
                    'Vainilla',
                    'Vive lo dulce con nuestra tradicional vainilla.',
                    'images/aceiteVainilla.webp',
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'Encuentra nuestros productos al mejor precio en todo México.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Compra en todo el país por mercado libre las 24 horas los 365 días del año.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Compra en todo el país por Amazon, es fácil, rápido y seguro.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'Visita nuestro recetario y disfruta del sabor San Salvador',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Image.asset('images/imgVisit.png'),
              const SizedBox(height: 32),
              const Center(
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Tel. 52 567 48 418',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'contacto@sansalvador.com',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 32),
                    Text(
                      'Síguenos en nuestras redes sociales:',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(Icons.message, color: Colors.lightBlue),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(Icons.inbox, color: Colors.purple),
                    onPressed: null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridTile(String title, String description, String imagePath) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(10)),
            child: Image.asset(imagePath,
                fit: BoxFit.cover, height: 120, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
