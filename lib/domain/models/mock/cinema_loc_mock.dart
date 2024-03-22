class CinemaLocationMock {
  const CinemaLocationMock({
    required this.name,
    required this.longitude,
    required this.latitude,
  });
  final String name;
  final double longitude;
  final double latitude;
}

const cinemasLocation = [
  CinemaLocationMock(name: "XXI Karawaci", longitude: 106.6064429, latitude: -6.2273768),
  CinemaLocationMock(name: "Summarecon Mall Serpong XXI", longitude: 106.6283383, latitude: -6.2413015),
  CinemaLocationMock(name: "XXI Alam Sutera", longitude: 106.6520477, latitude: -6.2227615),
  CinemaLocationMock(name: "Ciputra Cibubur XXI", longitude: 106.9258062, latitude: -6.383116),
  CinemaLocationMock(name: "XXI PGC", longitude: 106.8652239, latitude: -6.2624152),
];
