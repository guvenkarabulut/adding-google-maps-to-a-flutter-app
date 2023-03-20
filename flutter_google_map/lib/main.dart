import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue[800],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Maps Demo'),
          centerTitle: true,
          elevation: 2,
        ),
        // GoogleMap widgetini body kısmına ekliyoruz ve onMapCreated fonksiyonunu çağırıyoruz
        // onMapCreated fonksiyonu ile mapController değişkenine erişebiliyoruz
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          // "initialCameraPosition:" Sayfa açıldığında gözükecek konum ve zoom değeri
          initialCameraPosition: const CameraPosition(
            target: LatLng(38.868862, 35.428293),
            zoom: 7,
          ),
        ),
      ),
    );
  }
}
