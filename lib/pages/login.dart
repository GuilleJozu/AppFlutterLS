import 'package:flutter/material.dart';
import 'principal.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage('images/logo.png')),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa tu correo electrónico';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa tu contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton(
                    /*
                    onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Iniciar sesión con los datos del formulario
                      print('Correo electrónico: ${_emailController.text}');
                      print('Contraseña: ${_passwordController.text}');
                    }
                  },
                  */

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EmpacadoraSanSalvadorApp()));
                    },
                    child: const Text('Iniciar sesión'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        fixedSize: Size(250, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
