import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:test_gift_app/registration_page.dart';

void main() {
  group('RegistrationPage validation', () {
    late RegistrationPageState state;

    setUp(() {
      final widget = RegistrationPage(key: UniqueKey());
      state = widget.createState() as RegistrationPageState;
      // Manually initialize controllers for testing
      state.emailController.text = '';
      state.passwordController.text = '';
      state.repeatPasswordController.text = '';
    });

    test('Validates email format', () {
      expect(state.validateEmail(''), 'Please enter your email');
      expect(state.validateEmail('notanemail'), 'Please enter a valid email');
      expect(state.validateEmail('test@example.com'), null);
    });

    test('Validates password length', () {
      expect(state.validatePassword(''), 'Please enter your password');
      expect(state.validatePassword('short'), 'Password must be at least 8 characters');
      expect(state.validatePassword('longenough'), null);
    });

    test('Validates matching passwords', () {
      state.passwordController.text = 'password123';
      expect(state.validateRepeatPassword(''), 'Please repeat your password');
      expect(state.validateRepeatPassword('different'), 'Passwords do not match');
      expect(state.validateRepeatPassword('password123'), null);
    });
  });
}
