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
  String generate(String emailOrName,
      {List<String> adjectives = const [],
      DateTime? date,
      bool hasNumbers = true,
      int numberSeed = 100,
      String prefix = '',
      String suffix = '',
      bool shortYear = true}) {
    // Check if emailOrName is email
    if (emailOrName.contains('@')) {
      emailOrName = emailOrName
          .substring(0, emailOrName.indexOf('@'))
          .replaceAll(RegExp(r'[^a-zA-Z\d]'), '');
    }

    emailOrName = emailOrName
        .trim()
        .replaceAll(RegExp(r'[^a-zA-Z\d\s]'), ' ')
        .replaceAll(RegExp(r'\s{2,}'), ' ')
        .replaceAll(' ', separator);

    // generate date string
    var dateString = '';
    if (date != null) {
      if (shortYear) {
        dateString = date.year.toString().substring(2, 4);
      } else {
        dateString = date.year.toString();
      }
    }

    var adjective = '';
    if (adjectives.isNotEmpty) {
      adjective = _getRandomElement(adjectives);
    }

    var numberString = '';
    if (dateString == '' && hasNumbers) {
      numberString = _random.nextInt(numberSeed).toString();
    }

    return [prefix, adjective, emailOrName, dateString, numberString, suffix]
        .where((element) => element.isNotEmpty)
        .join(separator)
        .toLowerCase();
  }

  /// Generate username for first and lastname
  String generateForName(String firstName,
      {String lastName = '',
      List<String> adjectives = const [],
      bool hasNumbers = true,
      int numberSeed = 100}) {
    var names = [
      [lastName, firstName].join(' '),
      [firstName, lastName].join(' '),
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
  List<String> generateList(String emailOrName,
      {List<String> adjectives = const [],
      DateTime? date,
      bool hasNumbers = true,
      int numberSeed = 100,
      String prefix = '',
      String suffix = '',
      bool shortYear = true,
      int length = 1}) {
    var usernames = <String>[];
    for (var i = 0; i < length; i++) {
      usernames.add(generate(emailOrName,
          date: date,
          adjectives: adjectives,
          hasNumbers: hasNumbers,
          numberSeed: numberSeed,
          shortYear: shortYear,
          prefix: prefix,
          suffix: suffix));
    }

    return usernames;
  }

  /// Generates a list of username for first and lastname
  List<String> generateListForName(String firstName,
      {String lastName = '',
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
String generateRandom({int characterLength = 12}) {
    // Create a variable that holds a random integer between 0 and 99
    var ranSuffix = _random.nextInt(100);
    // Concatenate a random element from the `adjectives` list, a random element from the `names` list, and the `ranSuffix` variable, separated by the `separator` string. 
    // And convert it to lower case
    String generatedString = [_getRandomElement(adjectives), _getRandomElement(names), ranSuffix]
        .join(separator)
        .toLowerCase();
    // If the user provided characterLength is greater than the generated string, then use the length of the generated string instead
    if(characterLength > generatedString.length){
      characterLength = generatedString.length;
    }
    // Return the substring from the generated string from the beginning to the user provided characterLength
    return generatedString.substring(0,characterLength);
  }



  /// Get a random element from the list given
  dynamic _getRandomElement(List<dynamic> list) {
    return list[(_random.nextDouble() * list.length).floor()];
  }
}
