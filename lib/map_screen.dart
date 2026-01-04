import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapboxMap? mapboxMap;
  bool _locationPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    final token = dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? '';
    if (token.isNotEmpty) {
      MapboxOptions.setAccessToken(token);
    }
    _checkAndRequestLocationPermission();
  }

  Future<void> _enableLocationTracking() async {
    if (mapboxMap == null || !_locationPermissionGranted) return;

    final location = await mapboxMap!.location;
    await location.updateSettings(LocationComponentSettings(
      enabled: true,
      puckBearingEnabled: true,
      pulsingEnabled: true,
    ));

    try {
      final position = await geo.Geolocator.getCurrentPosition();
      await mapboxMap!.flyTo(
        CameraOptions(
          center: Point(coordinates: Position(position.longitude, position.latitude)),
          zoom: 16.0,
        ),
        MapAnimationOptions(duration: 1000),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nie udalo sie pobrac lokalizacji'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Future<void> _checkAndRequestLocationPermission() async {
    bool serviceEnabled;
    geo.LocationPermission permission;

    serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Brak dostepu do lokalizacji'),
            duration: Duration(seconds: 3),
          ),
        );
      }
      return;
    }

    permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Brak dostepu do lokalizacji'),
              duration: Duration(seconds: 3),
            ),
          );
        }
        return;
      }
    }

    if (permission == geo.LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Brak dostepu do lokalizacji'),
            duration: Duration(seconds: 3),
          ),
        );
      }
      return;
    }

    setState(() {
      _locationPermissionGranted = true;
    });

    _enableLocationTracking();
  }

  _onMapCreated(MapboxMap map) {
    mapboxMap = map;
    if (_locationPermissionGranted) {
      _enableLocationTracking();
    }
  }

  @override
  Widget build(BuildContext context) {
    final token = dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? '';

    if (token.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mapa'),
        ),
        body: const Center(
          child: Text(
            'Brakuje MAPBOX_ACCESS_TOKEN w pliku .env',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          if (_locationPermissionGranted)
            const Icon(Icons.location_on, color: Colors.green)
          else
            const Icon(Icons.location_off, color: Colors.red),
          const SizedBox(width: 16),
        ],
      ),
      body: MapWidget(
        key: const ValueKey("mapWidget"),
        cameraOptions: CameraOptions(
          center: Point(coordinates: Position(17.0326, 51.1097)),
          zoom: 15.0,
        ),
        styleUri: MapboxStyles.MAPBOX_STREETS,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
