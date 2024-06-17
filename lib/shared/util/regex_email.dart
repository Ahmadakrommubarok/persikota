bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return emailRegex.hasMatch(email);
}

String? validateEmail(String? email) {
  if (email == null) {
    return 'Mohon masukan email anda.';
  }
  if (!isValidEmail(email)) {
    return 'Mohon masukan email dengan format yang benar.';
  }
  return null;
}
