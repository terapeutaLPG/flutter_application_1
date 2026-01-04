class TileModel {
  final String tileId;
  final double minLat;
  final double minLon;
  final double maxLat;
  final double maxLon;
  final DateTime? visitedAt;

  TileModel({
    required this.tileId,
    required this.minLat,
    required this.minLon,
    required this.maxLat,
    required this.maxLon,
    this.visitedAt,
  });

  factory TileModel.fromFirestore(Map<String, dynamic> data) {
    return TileModel(
      tileId: data['tileId'] as String,
      minLat: (data['minLat'] as num).toDouble(),
      minLon: (data['minLon'] as num).toDouble(),
      maxLat: (data['maxLat'] as num).toDouble(),
      maxLon: (data['maxLon'] as num).toDouble(),
      visitedAt: data['visitedAt'] != null 
          ? (data['visitedAt'] as dynamic).toDate()
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'tileId': tileId,
      'minLat': minLat,
      'minLon': minLon,
      'maxLat': maxLat,
      'maxLon': maxLon,
      'visitedAt': visitedAt,
    };
  }
}
