import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

final _titleAppBar = 'Criando transferência';

final _labelTextNumeroConta = 'Número da conta';
final _hintTextNumeroConta = 'Digite o número de sua conta.';

final _labelTextValor = 'Valor';
final _hintTextValor = 'Digite o valor da transferência.';

final _textButton = 'Confimar';

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() {
    return _FormularioTransferenciaState();
  }
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _campoNumeroConta = TextEditingController();
  final TextEditingController _campoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              _campoNumeroConta,
              labelText: _labelTextNumeroConta,
              hintText: _hintTextNumeroConta,
            ),
            Editor(
              _campoValor,
              labelText: _labelTextValor,
              hintText: _hintTextValor,
              icon: Icons.monetization_on,
            ),
            Builder(
              builder: (ctx) => RaisedButton(
                child: Text(_textButton),
                onPressed: () => _transfer(ctx),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Realiza a transferência
  void _transfer(BuildContext ctx) {
    final String numeroConta = _campoNumeroConta.text;
    final double valor = double.tryParse(_campoValor.text);

    if (numeroConta.isNotEmpty && valor != null) {
      final Transferencia _transferencia = Transferencia(valor, numeroConta);
      Navigator.pop(ctx, _transferencia);
    }
  }
}
