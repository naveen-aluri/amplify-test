import 'package:amplify_test/utils/validations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email Validation', () {
    test('Success Test 1', () {
      var result = Validations.isValidEmail('abc@gmail.com');
      expect(result, true);
    });
    test('Success Test 2', () {
      var result = Validations.isValidEmail('abc@outlook.com');
      expect(result, true);
    });
    test('Success Test 3', () {
      var result = Validations.isValidEmail('abc@yahoo.co.in');
      expect(result, true);
    });
    test('Success Test 4', () {
      var result = Validations.isValidEmail('a@yahoo.co.inurehi');
      expect(result, true);
    });
    test('Failed Test 1', () {
      var result = Validations.isValidEmail('abcgmail.com');
      expect(result, false);
    });
    test('Failed Test 2', () {
      var result = Validations.isValidEmail('abc@gmailcom');
      expect(result, false);
    });
    test('Failed Test 3', () {
      var result = Validations.isValidEmail('@srg.co.in');
      expect(result, false);
    });
  });

  group('Password Validation', () {
    test('Success Test 1', () {
      var result = Validations.isPasswordValid('abcABC123', 'abcABC123');
      expect(result, true);
    });
    test('Success Test 2', () {
      var result = Validations.isPasswordValid('Aa1asdfgh', 'Aa1asdfgh');
      expect(result, true);
    });
    test('Success Test 3', () {
      var result = Validations.isPasswordValid('abc@1234-ABC', 'abc@1234-ABC');
      expect(result, true);
    });

    test('Failed Test 1', () {
      var result = Validations.isPasswordValid('abA12', 'abA12');
      expect(result, false);
    });
    test('Failed Test 2', () {
      var result = Validations.isPasswordValid('123456aa', '123456aa');
      expect(result, false);
    });
    test('Failed Test 3', () {
      var result = Validations.isPasswordValid('ASDF1234', 'ASDF1234');
      expect(result, false);
    });
  });
}
