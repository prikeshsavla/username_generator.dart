/// A simple library for generating random
/// and seedable username for emails or user forms
library username_generator;

import 'dart:math';

import 'src/seed_data.dart' as seed_data;

/// A Username Generator.
class UsernameGenerator {
  /// A separator for the username
  String separator = '_';

  /// A list of names for generating a random username from
  List<String> names = seed_data.names;

  /// A list of adjectives for generating a random username from
  List<String> adjectives = seed_data.adjectives;
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

  /// Generates a list of username for first and lastname
  List<String> generateListForName(String firstName,
      {String lastName = "",
      List<String> adjectives = const [],
      bool hasNumbers = true,
      int numberSeed = 100,
      length: 1}) {
    var usernames = <String>[];
    for (var i = 0; i < length; i++) {
      usernames.add(generateForName(
        firstName,
        lastName: lastName,
        adjectives: adjectives,
        hasNumbers: hasNumbers,
        numberSeed: numberSeed,
      ));
    }

    return usernames;
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
