import 'tile_model.dart';
import 'dart:math';

class TileCalculator {
  static const double tileSize = 100.0;
  static const double metersPerDegreeLatitude = 111320.0;

  static String calculateTileId(double lat, double lon) {
    final latIndex = (lat * metersPerDegreeLatitude / tileSize).floor();
    final metersPerDegreeLongitude = metersPerDegreeLatitude * cos(lat * pi / 180);
    final lonIndex = (lon * metersPerDegreeLongitude / tileSize).floor();
    
    return '${latIndex}_$lonIndex';
  }

  static TileModel getTileBounds(double lat, double lon) {
    final tileId = calculateTileId(lat, lon);
    
    final latIndex = (lat * metersPerDegreeLatitude / tileSize).floor();
    final metersPerDegreeLongitude = metersPerDegreeLatitude * cos(lat * pi / 180);
    final lonIndex = (lon * metersPerDegreeLongitude / tileSize).floor();
    
    final minLat = latIndex * tileSize / metersPerDegreeLatitude;
    final maxLat = (latIndex + 1) * tileSize / metersPerDegreeLatitude;
    
    final minLon = lonIndex * tileSize / metersPerDegreeLongitude;
    final maxLon = (lonIndex + 1) * tileSize / metersPerDegreeLongitude;
    
    return TileModel(
      tileId: tileId,
      minLat: minLat,
      minLon: minLon,
      maxLat: maxLat,
      maxLon: maxLon,
    );
  }
}
