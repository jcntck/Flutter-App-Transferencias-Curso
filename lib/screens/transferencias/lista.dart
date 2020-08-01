import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

final _tittleAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  _ListaTransferenciasState createState() {
    return _ListaTransferenciasState();
  }
}

class _ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tittleAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/transferencia/create').then(
            (transferenciaRecebida) =>
                _atualizaTransferencias(transferenciaRecebida),
          );
        },
      ),
    );
  }

  void _atualizaTransferencias(Object transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() => widget._transferencias.add(transferenciaRecebida));
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.attach_money),
        ),
        title: Text(this._transferencia.valor.toString()),
        subtitle: Text(this._transferencia.numeroConta),
      ),
    );
  }
}
