import 'dart:math';

import 'username_generator_data.dart';

/// A UsernameGenerator.
class UsernameGenerator {
  /// A separator for the username
  String separator = '_';

  /// A list of names for generating a random username from
  List<String> names = UsernameGeneratorData.names;

  /// A list of adjectives for generating a random username from
  List<String> adjectives = UsernameGeneratorData.adjectives;

  final Random _random = Random();

  /// Overwrite seeded names
  void setNames(List<String> names) {
    names = names;
  }

  /// Overwrite seeded adjectives
  void setAdjectives(List<String> adjectives) {
    adjectives = adjectives;
  }

  /// Change username separator
  void setSeparator(String separator) {
    separator = separator;
  }

  /// Returns generater Username
  String generateRandom() {
    var ranSuffix = (_random.nextDouble() * 100).ceil();
    //${adjectives[ran_b]}${separator}${names[ran_a]}
    return _joinWithSeparator([
      _getRandomElement(adjectives),
      _getRandomElement(names),
      ranSuffix
    ]..shuffle());
  }

  /// Generate username for first and lastname
  String generateForName(String firstName,
      {String lastName = "",
      List<String> adjectives = const [],
      bool hasNumbers = true,
      int numberSeed = 100}) {
    var names = [
      [lastName, firstName].join(separator),
      [firstName, lastName].join(separator),
      firstName,
      lastName
    ].where((element) => element.isNotEmpty).toList();

    String name = _getRandomElement(names);

    var adjective = "";
    if (adjectives.isNotEmpty) {
      adjective = _getRandomElement(adjectives);
    }

    var numberString = "";
    if (hasNumbers) {
      numberString = (_random.nextDouble() * numberSeed).ceil().toString();
    }
    var result = [adjective, name, numberString];
    //${adjectives[ran_b]}${separator}${names[ran_a]}
    return _joinWithSeparator(
        result.where((element) => element.isNotEmpty).toList()..shuffle());
  }

  /// Join Array string using the separator
  String _joinWithSeparator(List<dynamic> result) {
    return result.join(separator).toLowerCase();
  }

  /// Get a random element from the list given
  dynamic _getRandomElement(List<dynamic> list) {
    return list[(_random.nextDouble() * list.length).floor()];
  }
}
