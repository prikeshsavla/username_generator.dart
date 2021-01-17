import 'package:test/test.dart';

import 'package:username_generator/username_generator.dart';

void main() {
  group('generate a random username', () {
    final usernameGenerator = UsernameGenerator();
    String username = usernameGenerator.generateRandom();
    test('where username contains numbers', () {
      RegExp maxThreeDigits = new RegExp(
        r"\d{1,3}",
        caseSensitive: false,
        multiLine: false,
      );

      expect(maxThreeDigits.hasMatch(username), true);
    });

    test('where username contains letters', () {
      RegExp containsLetters = new RegExp(
        r"[a-z]+",
        caseSensitive: false,
        multiLine: false,
      );
      expect(containsLetters.hasMatch(username), true);
    });
  });
  group('generate a username for first name Prikesh', () {
    final usernameGenerator = UsernameGenerator();
    String username = usernameGenerator.generateForName("Prikesh");
    print("Username: $username");
    RegExp maxThreeDigits = new RegExp(
      r"\d{1,3}",
      caseSensitive: false,
      multiLine: false,
    );
    test('where username contains numbers', () {
      expect(maxThreeDigits.hasMatch(username), true);
    });

    test('where username contains letters', () {
      RegExp containsLetters = new RegExp(
        r"[a-z]+",
        caseSensitive: false,
        multiLine: false,
      );
      expect(containsLetters.hasMatch(username), true);
    });
    test('where username contains the word prikesh', () {
      expect(username, contains("prikesh"));

      // expect(() => usernameGenerator.generateForName(null), throwsNoSuchMethodError);
    });
    test('where hasNumbers is false ', () {
      expect(
          maxThreeDigits.hasMatch(
              usernameGenerator.generateForName("Prikesh", hasNumbers: false)),
          false);
    });
  });
}
