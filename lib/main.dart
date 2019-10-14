import 'package:flutter/material.dart';
import 'package:flutter_dso2/models/restaurante.dart';
import 'models/restaurante.dart';
import 'models/Dialogs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floripa Ocean',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  var items = new List<Restaurante>();

  HomePage() {
    items = [];
    items.add(Restaurante
      (name: "Rita Maria Lagosteria",
      horario: ["18:30", "23:30"],
      endereco: "R. Henrique Valgas, 318 - Centro, Florianópolis - SC, 88010-220",
      bebidas: ["Água mineral", "Refrigerante", "Café", "Cerveja", "Gim", "Vodka"],
      cardapio: ["Ostra", "Ostra Gratinada", "Camarão", "Camarão ao bafo", "Camarão frito"],
      latitude: -27.594203,
      longitude: -48.561365
    ));
    items.add(Restaurante
      (name: "Restaurante Terra Santa Canasvieiras",
      horario: ["10:00", "20:00"],
      endereco: " R. Antenor Borges, 241 - Canasvieiras, Florianópolis - SC, 88054-070",
      bebidas: ["Água mineral", "Refrigerante", "Café", "Cerveja", "Gim", "Vodka"],
      cardapio: ["Ostra", "Ostra Gratinada", "Camarão", "Camarão ao bafo", "Camarão frito"],
      latitude: -27.427223,
      longitude: -48.456182
    ));
    items.add(Restaurante
      (name: "Ostradamus",
      horario: ["12:00", "23:00"],
      endereco: "Rodovia Baldicero Filomeno 7640 z - Ribeirão da Ilha, SC, 88064-002",
      bebidas: ["Água mineral", "Refrigerante", "Café", "Cerveja", "Gim", "Vodka"],
      cardapio: ["Ostra", "Ostra Gratinada", "Camarão", "Camarão ao bafo", "Camarão frito"],
      latitude: -27.720065,
      longitude: -48.564269
    ));

  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dialogs dialogs = new Dialogs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floripa Ocean"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index){
          final item = widget.items[index];
          return
            ListTile(
              title: Text(item.name),
              key: Key(item.name),
              onTap: () {
                dialogs.information(context, item.name, item.horario[0], item.horario[1], item.latitude, item.longitude);
              },
            );
        },
      ),
    );
  }
}
