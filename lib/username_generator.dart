library username_generator;

import 'dart:math';

import 'package:username_generator/username_generator_data.dart';


/// A Username Generator.
class UsernameGenerator {
  String seperator = '_';
  List<String> names = UsernameGeneratorData.names;
  List<String> adjectives = UsernameGeneratorData.adjectives;
  Random _random = new Random();
  void setNames(names) {
    names = names;
  }

  void setAdjectives(adjectives) {
    adjectives = adjectives;
  }

  void setSeperator(seperator) {
    seperator = seperator;
  }

  /// Returns generater Username
  String generateRandom() {
    int ranSuffix = (_random.nextDouble() * 100).ceil();
    //${adjectives[ran_b]}${seperator}${names[ran_a]}
    return joinWithSeparator([
      _getRandomElement(adjectives),
      _getRandomElement(names),
      ranSuffix
    ]..shuffle());
  }

  String generateForName(String firstName,
      {String lastName = "",
      List<String> adjectives = const [],
      bool hasNumbers = true,
      int numberSeed = 100}) {
    List<String> names = [
      [lastName, firstName].join(seperator),
      [firstName, lastName].join(seperator),
      firstName,
      lastName
    ].where((element) => element.length > 0).toList();

    String name = _getRandomElement(names);

    String adjective = "";
    if (adjectives.isNotEmpty) {
      adjective = _getRandomElement(adjectives);
    }

    String numberString = "";
    if (hasNumbers) {
      numberString = (_random.nextDouble() * numberSeed).ceil().toString();
    }
    List<String> result = [adjective, name, numberString];
    //${adjectives[ran_b]}${seperator}${names[ran_a]}
    return joinWithSeparator(
        result.where((element) => element.length > 0).toList()..shuffle());
  }

  String joinWithSeparator(List<dynamic> result) {
    return result.join(seperator).toLowerCase();
  }

  dynamic _getRandomElement(List<dynamic> list) {
    return list[(_random.nextDouble() * list.length).floor()];
  }
}
