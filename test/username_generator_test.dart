import 'package:test/test.dart';

import 'package:username_generator/username_generator.dart';

void main() {
  group('generate a random username', () {
    final generator = UsernameGenerator();
    var username = generator.generateRandom();
    test('where username contains numbers', () {
      var maxThreeDigits = RegExp(
        r"\d{1,3}",
        caseSensitive: false,
        multiLine: false,
      );

      expect(maxThreeDigits.hasMatch(username), true);
    });

    test('where username contains letters', () {
      var containsLetters = RegExp(
        r"[a-z]+",
        caseSensitive: false,
        multiLine: false,
      );
      expect(containsLetters.hasMatch(username), true);
    });
  });
  group('generate a username for first name John', () {
    final generator = UsernameGenerator();
    var username = generator.generateForName("John");
    var maxThreeDigits = RegExp(
      r"\d{1,3}",
      caseSensitive: false,
      multiLine: false,
    );
    test('where username contains numbers', () {
      expect(maxThreeDigits.hasMatch(username), true);
    });

    test('where username contains letters', () {
      var containsLetters = RegExp(
        r"[a-z]+",
        caseSensitive: false,
        multiLine: false,
      );
      expect(containsLetters.hasMatch(username), true);
    });
    test('where username contains the word john', () {
      expect(username, contains("john"));
    });
    test('where hasNumbers is false ', () {
      expect(
          maxThreeDigits
              .hasMatch(generator.generateForName("John", hasNumbers: false)),
          false);
    });
  });

  group('generate a list of usernames for John Doe', () {
    final generator = UsernameGenerator();

    test('where it returns a list of 5 items', () {
      var usernames =
          generator.generateListForName("John", lastName: "Doe", length: 5);
      expect(usernames, allOf([hasLength(5), isA<List<String>>()]));
    });
  });

  group('generate a username for a name "John Doe"', () {
    final generator = UsernameGenerator();
    var username = generator.generate("John Doe");
    var maxThreeDigits = RegExp(
      r"\d{1,3}",
      caseSensitive: false,
      multiLine: false,
    );
    test('where username contains numbers', () {
      expect(maxThreeDigits.hasMatch(username), true);
    });

    test('where username contains letters', () {
      var containsLetters = RegExp(
        r"[a-z]+",
        caseSensitive: false,
        multiLine: false,
      );
      expect(containsLetters.hasMatch(username), true);
    });
    test('where username contains the word john', () {
      expect(username, contains("john"));
    });

    test('where username contains the word doe', () {
      expect(username, contains("doe"));
    });
    test('where hasNumbers is false ', () {
      expect(
          maxThreeDigits
              .hasMatch(generator.generateForName("John", hasNumbers: false)),
          false);
    });
  });

  group('generate for "john.doe55@example.com" and date "15-01-1996"', () {
    final generator = UsernameGenerator();
    var username = generator.generate("john.doe55@example.com",
        date: DateTime.parse("1996-01-15"));

    test('where username contains the word johndoe', () {
      expect(username, contains("johndoe55"));
    });

    test('where username contains the word 15 or 01 or 1996 or 96', () {
      expect(
          username,
          anyOf([
            contains("15"),
            contains("01"),
            contains("1996"),
            contains("96"),
          ]));
    });
  });
}
