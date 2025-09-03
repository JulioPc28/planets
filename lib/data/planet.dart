class Planet {
  final String name;
  final String image;
  final String mass; /* viene como String en el JSON, con notación científica */
  final double orbitalDistance;
  final int equatorialRadius;
  final String volume; /* también viene como String, por su formato textual */
  final double density;
  final double gravity;
  final int escapeVelocity;
  final double dayLength;
  final double yearLength;
  final int orbitalSpeed;
  final String atmosphere;
  final int moons;
  final String description;

  /* 
    Constructor principal del modelo Planet.
    Todos los campos son requeridos para asegurar consistencia en la visualización.
  */
  Planet({
    required this.name,
    required this.image,
    required this.mass,
    required this.orbitalDistance,
    required this.equatorialRadius,
    required this.volume,
    required this.density,
    required this.gravity,
    required this.escapeVelocity,
    required this.dayLength,
    required this.yearLength,
    required this.orbitalSpeed,
    required this.atmosphere,
    required this.moons,
    required this.description,
  });

  /* 
    Método de fábrica que construye una instancia Planet a partir de un Map (JSON).
    Se realiza conversión segura de tipos para evitar errores de tipado en tiempo de ejecución.
  */
  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'],
      image: json['image'],
      mass: json['mass_kg'].toString(), /* se fuerza a String por formato inconsistente */
      orbitalDistance: (json['orbital_distance_km'] as num).toDouble(),
      equatorialRadius: (json['equatorial_radius_km'] as num).toInt(),
      volume: json['volume_km3'].toString(), /* también se fuerza a String */
      density: (json['density_g_cm3'] as num).toDouble(),
      gravity: (json['surface_gravity_m_s2'] as num).toDouble(),
      escapeVelocity: (json['escape_velocity_kmh'] as num).toInt(),

      /* 
        Algunos planetas tienen `day_length_earth_days`, otros `day_length_earth_years`.
        Se toma el que esté disponible y se convierte a double.
      */
      dayLength: (json['day_length_earth_days'] ?? json['day_length_earth_years']) is num
          ? (json['day_length_earth_days'] ?? json['day_length_earth_years']).toDouble()
          : double.tryParse((json['day_length_earth_days'] ?? json['day_length_earth_years']).toString()) ?? 0.0,

      /* 
        Mismo tratamiento para la duración del año.
        Se asegura que el valor sea numérico y convertible a double.
      */
      yearLength: (json['year_length_earth_days'] ?? json['year_length_earth_years']) is num
          ? (json['year_length_earth_days'] ?? json['year_length_earth_years']).toDouble()
          : double.tryParse((json['year_length_earth_days'] ?? json['year_length_earth_years']).toString()) ?? 0.0,

      orbitalSpeed: (json['orbital_speed_kmh'] as num).toInt(),
      atmosphere: json['atmosphere_composition'],
      moons: (json['moons'] as num).toInt(),
      description: json['description'],
    );
  }
}