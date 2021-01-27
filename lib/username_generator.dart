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

  /// Generate username from email or name, date or numbers
  String generate(String base,
      {List<String> adjectives = const [],
      DateTime date,
      bool hasNumbers = true,
      int numberSeed = 100}) {
    // Check if base is email
    if (base.indexOf("@") != -1) {
      base = base
          .substring(0, base.indexOf("@"))
          .replaceAll(RegExp(r"[^a-zA-Z\d]"), "");
    }

    base = base
        .trim()
        .replaceAll(RegExp(r"[^a-zA-Z\d\s]"), " ")
        .replaceAll(RegExp(r"\s{2,}"), " ")
        .replaceAll(" ", separator);

    // generate date string
    var dateString = "";
    if (date != null) {
      dateString = _getRandomElement([
        date.year.toString(),
        date.year.toString().substring(2, 4),
        date.day.toString(),
        date.month.toString().padLeft(2, "0")
      ]);
    }

    var adjective = "";
    if (adjectives.isNotEmpty) {
      adjective = _getRandomElement(adjectives);
    }

    var numberString = "";
    if (dateString == "" && hasNumbers) {
      numberString = _random.nextInt(numberSeed).toString();
    }

    return [adjective, base, dateString, numberString]
        .where((element) => element.isNotEmpty)
        .join(separator)
        .toLowerCase();
  }

  /// Generate username for first and lastname
  String generateForName(String firstName,
      {String lastName = "",
      List<String> adjectives = const [],
      bool hasNumbers = true,
      int numberSeed = 100}) {
    var names = [
      [lastName, firstName].join(" "),
      [firstName, lastName].join(" "),
      [firstName, lastName].join(),
      firstName,
      lastName
    ].where((element) => element.isNotEmpty).toList();

    String name = _getRandomElement(names);

    //${adjectives[ran_b]}${separator}${names[ran_a]}
    return generate(name,
        adjectives: adjectives, hasNumbers: hasNumbers, numberSeed: numberSeed);
  }

  /// Generates a list of username for first and lastname
  List<String> generateList(String base,
      {List<String> adjectives = const [],
      DateTime date,
      bool hasNumbers = true,
      int numberSeed = 100,
      int length = 1}) {
    var usernames = <String>[];
    for (var i = 0; i < length; i++) {
      usernames.add(generate(
        base,
        date: date,
        adjectives: adjectives,
        hasNumbers: hasNumbers,
        numberSeed: numberSeed,
      ));
    }

    return usernames;
  }

  /// Generates a list of username for first and lastname
  List<String> generateListForName(String firstName,
      {String lastName = "",
      List<String> adjectives = const [],
      bool hasNumbers = true,
      int numberSeed = 100,
      int length = 1}) {
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

  /// Returns generater Username
  String generateRandom() {
    var ranSuffix = _random.nextInt(100);
    //${adjectives[ran_b]}${separator}${names[ran_a]}
    return [_getRandomElement(adjectives), _getRandomElement(names), ranSuffix]
        .join(separator)
        .toLowerCase();
  }

  /// Get a random element from the list given
  dynamic _getRandomElement(List<dynamic> list) {
    return list[(_random.nextDouble() * list.length).floor()];
  }
}
