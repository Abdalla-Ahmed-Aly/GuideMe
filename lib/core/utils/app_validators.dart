class AppValidators {
  // Name
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  // Email
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Password
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    final hasUpper = value.contains(RegExp(r'[A-Z]'));
    final hasLower = value.contains(RegExp(r'[a-z]'));
    final hasDigit = value.contains(RegExp(r'[0-9]'));
    final hasSpecial = value.contains(RegExp(r'[^a-zA-Z0-9]'));

    // Build message dynamically based on what's missing
    final List<String> errors = [];

    if (!hasUpper) errors.add('uppercase letter');
    if (!hasLower) errors.add('lowercase letter');
    if (!hasDigit) errors.add('number');
    if (!hasSpecial) errors.add('special character');

    if (errors.isNotEmpty) {
      return 'Password must contain ${errors.join(', ')}';
    }

    return null;
  }

  // Confirm Password
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Phone number (Egypt only — 11 digits starting with 01)
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^01[0-9]{9}$');

    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Enter a valid Egyptian phone number (11 digits starting with 01)';
    }

    return null;
  }

  // Pin
  static String? pin(String? value, {int length = 6}) {
    if (value == null || value.trim().isEmpty) {
      return 'PIN code is required';
    }

    // Remove spaces just in case
    value = value.trim();

    // Check only numbers
    final onlyDigits = RegExp(r'^[0-9]+$');
    if (!onlyDigits.hasMatch(value)) {
      return 'PIN must contain digits only';
    }

    // Validate length (4-digit, 6-digit…)
    if (value.length != length) {
      return 'PIN must be $length digits';
    }

    return null;
  }
}