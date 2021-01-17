# username_generator

Simple library for random and seedable username generators to use in flutter and dart

## Usage

A simple usage example:
```dart
import 'package:username_generator/username_generator.dart';

main() {
  UsernameGenerator generator = new UsernameGenerator();

  print(generator.generateRandom());
  // limitation_virulent_1

  print(generator.generateForName("John"));
  // john_47

  print(generator.generateForName("John", lastName: "Doe"));
  // 36_john_doe

  print(generator.generateForName("John", lastName: "Doe", hasNumbers: false));
  // doe_john

   print( generator.generateForName("John",
                                    lastName: "Doe", 
                                    adjectives: ["ready", "happy"]),
                                    );
      // doe_john_10_ready
}

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/prikeshsavla/username_generator.dart/issues


## Future Additions

- Generate a certain number of usernames