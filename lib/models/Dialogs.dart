import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dialogs{
  information(BuildContext context, String name, String abertura, String fechamento, double latitude, double longitude) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Horário:  " + abertura + "h - " + fechamento + "h"),
                Text("Localização" + "lat: " + latitude.toString() + " / " "long: " + longitude.toString())
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute<Null>(
                  builder: (context) => MapDialog(),
                  fullscreenDialog: false
              )),
              child: Text("See location"),
            ),
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            )
          ],
        );
      }
    );
  }
}

class Geolocation {
  final double latitude;
  final double longitude;

  Geolocation(this.latitude, this.longitude);
}


class MapDialog extends StatefulWidget {
  final Geolocation geolocation;

  MapDialog({Key key, @required this.geolocation}) : super(key: key);

  @override
  MapDialogState createState() => new MapDialogState();
}

class MapDialogState extends State<MapDialog> {
  GoogleMapController mapController;


  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Localização do restaurante'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}


