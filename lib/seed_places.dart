import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class SeedPlaces {
  static final List<Map<String, dynamic>> _places = [
    {"id": "rynek", "name": "Rynek Wroclaw", "lat": 51.1097, "lon": 17.0326},
    {"id": "hala_stulecia", "name": "Hala Stulecia", "lat": 51.1079, "lon": 17.0790},
    {"id": "zoo_afrykarium", "name": "Zoo Afrykarium", "lat": 51.1046, "lon": 17.0740},
    {"id": "most_tumski", "name": "Most Tumski", "lat": 51.1102, "lon": 17.0385},
    {"id": "ostrow_tumski", "name": "Ostrow Tumski", "lat": 51.1112, "lon": 17.0417},
    {"id": "park_szczytnicki", "name": "Park Szczytnicki", "lat": 51.1075, "lon": 17.0985},
    {"id": "sky_tower", "name": "Sky Tower", "lat": 51.0932, "lon": 17.0258},
    {"id": "plac_solny", "name": "Plac Solny", "lat": 51.1096, "lon": 17.0331},
    {"id": "ul_jatkowa", "name": "Ulica Jatkowa", "lat": 51.1090, "lon": 17.0290},
    {"id": "wzgorze_grobla", "name": "Wzgorze Grobla", "lat": 51.1123, "lon": 17.0458},
    {"id": "ul_powstancow_slaskich", "name": "ul. Powstancow Slaskich", "lat": 51.1118, "lon": 17.0561},
    {"id": "ul_sw_mikolaja", "name": "ul. Sw. Mikolaja", "lat": 51.1108, "lon": 17.0375},
    {"id": "ul_olkuska", "name": "ul. Olkuska", "lat": 51.1090, "lon": 17.0360},
    {"id": "ul_wita_stwosza", "name": "ul. Wita Stworza", "lat": 51.1094, "lon": 17.0328},
    {"id": "ul_szewska", "name": "ul. Szewska", "lat": 51.1096, "lon": 17.0310},
    {"id": "ul_kielbasnicza", "name": "ul. Kielbasnicza", "lat": 51.1088, "lon": 17.0323},
    {"id": "ul_ruska", "name": "ul. Ruska", "lat": 51.1089, "lon": 17.0348},
    {"id": "ul_kuznicka", "name": "ul. Kuznicka", "lat": 51.1098, "lon": 17.0299},
    {"id": "ul_grochowa", "name": "ul. Grochowa", "lat": 51.1120, "lon": 17.0409},
    {"id": "ul_kasprowicza", "name": "ul. Kasprowicza", "lat": 51.1133, "lon": 17.0602},
    {"id": "plac_grunwaldzki", "name": "Plac Grunwaldzki", "lat": 51.1216, "lon": 17.0572},
    {"id": "most_grunwaldzki", "name": "Most Grunwaldzki", "lat": 51.1211, "lon": 17.0598},
    {"id": "hala_targowa", "name": "Hala Targowa", "lat": 51.1145, "lon": 17.0453},
    {"id": "wyspa_slodowa", "name": "Wyspa Slodowa", "lat": 51.1102, "lon": 17.0299},
    {"id": "ul_karlowicza", "name": "ul. Karlowicza", "lat": 51.1128, "lon": 17.0512},
    {"id": "ul_mickiewicza", "name": "ul. Mickiewicza", "lat": 51.1119, "lon": 17.0510},
    {"id": "ul_legnicka", "name": "ul. Legnicka", "lat": 51.1147, "lon": 17.0373},
    {"id": "ul_sienkiewicza", "name": "ul. Sienkiewicza", "lat": 51.1103, "lon": 17.0478},
    {"id": "ul_slowianska", "name": "ul. Slowianska", "lat": 51.1125, "lon": 17.0547},
    {"id": "ul_staszica", "name": "ul. Staszica", "lat": 51.1136, "lon": 17.0582},
    {"id": "ul_kozuchowska", "name": "ul. Kozuchowska", "lat": 51.1154, "lon": 17.0362},
    {"id": "ul_warszawska", "name": "ul. Warszawska", "lat": 51.1172, "lon": 17.0475},
    {"id": "ul_krzycka", "name": "ul. Krzycka", "lat": 51.0915, "lon": 17.0400},
    {"id": "ul_gajowa", "name": "ul. Gajowa", "lat": 51.1080, "lon": 17.0944},
    {"id": "ul_raclawicka", "name": "ul. Raclawicka", "lat": 51.1069, "lon": 17.0341},
    {"id": "ul_muchoborska", "name": "ul. Muchoborska", "lat": 51.1110, "lon": 17.0195},
    {"id": "ul_batorego", "name": "ul. Batorego", "lat": 51.1082, "lon": 17.0268},
    {"id": "ul_swiebodzka", "name": "ul. Swiebodzka", "lat": 51.1101, "lon": 17.0229},
    {"id": "ul_zwycieska", "name": "ul. Zwycieska", "lat": 51.1099, "lon": 17.0637},
    {"id": "ul_ostrzeszowska", "name": "ul. Ostrzeszowska", "lat": 51.1043, "lon": 17.0199},
    {"id": "ul_wiadomosci", "name": "ul. Wiadomosci", "lat": 51.1093, "lon": 17.0300},
    {"id": "ul_bema", "name": "ul. Bema", "lat": 51.1085, "lon": 17.0221},
    {"id": "ul_lwowska", "name": "ul. Lwowska", "lat": 51.1157, "lon": 17.0447},
    {"id": "ul_towarowa", "name": "ul. Towarowa", "lat": 51.1122, "lon": 17.0344},
    {"id": "ul_grotowska", "name": "ul. Grotowska", "lat": 51.1139, "lon": 17.0408},
    {"id": "ul_orczyzna", "name": "ul. Orczyzna", "lat": 51.1107, "lon": 17.0390}
  ];

  static Future<void> seedPlacesIfEmpty() async {
    final coll = FirebaseFirestore.instance.collection('places');
    
    // Seed 46 main places
    for (var place in _places) {
      final doc = await coll.doc(place['id']).get();
      if (doc.exists) continue;
      
      await coll.doc(place['id']).set({
        'name': place['name'],
        'lat': place['lat'],
        'lon': place['lon'],
        'radiusMeters': 40,
        'points': 10
      });
    }

    // Seed centers with offsets
    final centers = <Map<String, dynamic>>[
      {'id': 'muchobor_wielki', 'name': 'Muchobor Wielki', 'lat': 51.0969, 'lon': 16.9555},
      {'id': 'muchobor_maly', 'name': 'Muchobor Maly', 'lat': 51.0952, 'lon': 16.9825},
      {'id': 'nowy_dwor', 'name': 'Nowy Dwor', 'lat': 51.1010, 'lon': 16.9445},
      {'id': 'kuzniki', 'name': 'Kuzniki', 'lat': 51.1102, 'lon': 16.9630},
      {'id': 'gadow_maly', 'name': 'Gadow Maly', 'lat': 51.1145, 'lon': 16.9565},
      {'id': 'popowice', 'name': 'Popowice', 'lat': 51.1216, 'lon': 16.9840},
      {'id': 'pilczyce', 'name': 'Pilczyce', 'lat': 51.1368, 'lon': 16.9575},
      {'id': 'kozanow', 'name': 'Kozanow', 'lat': 51.1455, 'lon': 16.9870},
      {'id': 'magnolia_park', 'name': 'Magnolia Park', 'lat': 51.1217, 'lon': 16.9847},
      {'id': 'wroclaw_fashion_outlet', 'name': 'Wroclaw Fashion Outlet', 'lat': 51.1008, 'lon': 16.9398},
    ];

    final offsets = const [
      {'suffix': '1', 'dlat': 0.0012, 'dlon': 0.0010},
      {'suffix': '2', 'dlat': -0.0011, 'dlon': -0.0010},
    ];

    for (final c in centers) {
      for (final o in offsets) {
        final id = '${c['id']}_${o['suffix']}';
        final doc = await coll.doc(id).get();
        if (doc.exists) continue;
        
        final name = '${c['name']} punkt ${o['suffix']}';
        final lat = (c['lat'] as num).toDouble() + (o['dlat'] as num).toDouble();
        final lon = (c['lon'] as num).toDouble() + (o['dlon'] as num).toDouble();

        await coll.doc(id).set({
          'name': name,
          'lat': lat,
          'lon': lon,
          'radiusMeters': 40,
          'points': 10,
        });
      }
    }
  }
}