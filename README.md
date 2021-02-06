# username_generator

A simple library for generating random and seedable username for emails or user forms

## Usage

A simple usage example:
```dart
import 'package:username_generator/username_generator.dart';

/// main function to start example
void main() {
  var generator = UsernameGenerator();

  //default separator is "_" 
  generator.setSeparator("_"); // optional
 
  print(generator.generateRandom());
  // limitation_virulent_1

   print(generator.generate("John"));
  // john_75

  print(generator.generate("John Doe"));
  // john_doe_6

  print(generator.generate("John Doe", hasNumbers: false));
  // john_doe

  print(generator.generate("johndoe@example.com", date: DateTime.parse("1996-01-15")));
  // johndoe_96

  print(
    generator.generateForName("John",
        lastName: "Doe", adjectives: ["ready", "happy"]),
  );
  // doe_john_10_ready

  print(
    generator.generateList("John Doe", adjectives: ["ready", "happy"], length: 5),
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

<a href="https://trackgit.com">
<img src="https://us-central1-trackgit-analytics.cloudfunctions.net/token/ping/kktasp39dxk2efhp04sk" alt="trackgit-views" />
</a>
