import 'dart:io';
class Contact {
  final String? name;
  final String? email;
  final String? work;
  final String? phone;
  final String? website;
  final File? image;

  Contact(
      {required this.name, required this.email, required this.image, required this.work, required this.phone, required this.website});
}
