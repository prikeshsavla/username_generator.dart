# username_generator

A simple library for generating random and seedable username for emails or user forms

## Usage

A simple usage example:
```dart
import 'package:username_generator/username_generator.dart';

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

  print(
    generator.generateListForName("John",
        lastName: "Doe", adjectives: ["ready", "happy"], length: 5),
  );
  // [
  // happy_doe_john_12,
  // 24_john_happy,
  // 70_ready_john,
  // 47_doe_ready,
  // ready_john_87
  // ]
}

```
## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/prikeshsavla/username_generator.dart/issues


## Roadmap