import 'package:username_generator/username_generator.dart';

/// main function to start example
void main() {
  var generator = UsernameGenerator();

  //default separator is '_'
  generator.separator = '_'; // optional

  print(generator.generateRandom());
  // limitation_virulent_1

  print(generator.generate('John'));
  // john_75

  print(generator.generate('John Doe'));
  // john_doe_6

  print(generator.generate('John Doe', hasNumbers: false));
  // john_doe

  print(generator.generate('johndoe@example.com',
      date: DateTime.parse('1996-01-15')));
  // johndoe_96
 
  print(
    generator.generateForName('John',
        lastName: 'Doe', adjectives: ['ready', 'happy']),
  );
  // doe_john_10_ready

  print(
    generator.generateList('John Doe',
        adjectives: ['ready', 'happy'], length: 5),
  );
  // [
  // happy_doe_john_12,
  // 24_john_happy,
  // 70_ready_john,
  // 47_doe_ready,
  // ready_john_87
  // ]
}
