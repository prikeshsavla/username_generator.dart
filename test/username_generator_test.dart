import 'package:test/test.dart';

import 'package:username_generator/username_generator.dart';

void main() {
  group('generate a random username', () {
    final usernameGenerator = UsernameGenerator();
    var username = usernameGenerator.generateRandom();
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
    final usernameGenerator = UsernameGenerator();
    var username = usernameGenerator.generateForName("John");
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
          maxThreeDigits.hasMatch(
              usernameGenerator.generateForName("John", hasNumbers: false)),
          false);
    });
  });

  group('generate a list of usernames for John Doe', () {
    final usernameGenerator = UsernameGenerator();

    test('where it returns a list of 5 items', () {
      var usernames = usernameGenerator.generateListForName("John",
          lastName: "Doe", length: 5);
      expect(usernames, allOf([hasLength(5), isA<List<String>>()]));
    });
  });
}
