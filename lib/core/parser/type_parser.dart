import 'dart:convert';

class TypeParser {
  /// Parses a string to an int. Returns null if parsing fails.
  static int? toInt(dynamic value) {
    if (value == null) return null;
    return int.tryParse(value.toString().trim());
  }

  /// Parses a string to a double. Returns null if parsing fails.
  static double? toDouble(dynamic value) {
    if (value == null) return null;
    return double.tryParse(value.toString().trim());
  }

  /// Parses a string to a bool. Accepts "true", "false", "1", "0" (case insensitive).
  static bool? toBool(dynamic value) {
    if (value == null) return null;
    final val = value.toString().trim().toLowerCase();
    if (val == 'true' || val == '1') return true;
    if (val == 'false' || val == '0') return false;
    return null;
  }

  static bool intToBool(dynamic value) => value == 1;
  static int boolToInt(bool value) => value ? 1 : 0;

  /// Smart parse: detects if the string is int, double, or bool.
  /// Order of precedence: int > double > bool.
  static dynamic parse(String? value) {
    if (value == null || value.trim().isEmpty) return null;

    final trimmed = value.trim();

    // Try parsing as int
    final intVal = int.tryParse(trimmed);
    if (intVal != null) return intVal;

    // Try parsing as double
    final doubleVal = double.tryParse(trimmed);
    if (doubleVal != null) return doubleVal;

    // Try parsing as bool
    final boolVal = toBool(trimmed);
    if (boolVal != null) return boolVal;

    // Return original string if nothing matched
    return trimmed;
  }

  static String listToJson(List<String> list) => jsonEncode(list);

  static List<String> listFromJson(dynamic json) {
    if (json == null) return [];
    if (json is String) return List<String>.from(jsonDecode(json));
    if (json is List) return List<String>.from(json);
    return [];
  }

  static T? parseObject<T>(
    T Function(Map<String, dynamic>? json) fromJson,
    Map<String, dynamic>? json,
  ) {
    if (json == null) return null;
    return fromJson(json);
  }
}
