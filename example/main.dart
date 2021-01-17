import 'package:username_generator/src/username_generator.dart';

/// main function to start example
void main() {
  var generator = UsernameGenerator();

  print(generator.generateRandom());
  // limitation_virulent_1

  print(generator.generateForName("John"));
  // john_47

  print(generator.generateForName("John", lastName: "Doe"));
  // 36_john_doe

  print(generator.generateForName("John", lastName: "Doe", hasNumbers: false));
  // doe_john

  print(
    generator.generateForName("John",
        lastName: "Doe", adjectives: ["ready", "happy"]),
  );
  // doe_john_10_ready
}
