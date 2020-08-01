import 'package:bytebank/screens/transferencias/formulario.dart';
import 'package:bytebank/screens/transferencias/lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyan[600],
        accentColor: Colors.cyan[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.cyan[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ListaTransferencias(),
        '/transferencia/create': (context) => FormularioTransferencia(),
      },
    );
  }
}
