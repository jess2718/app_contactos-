import 'dart:convert';

ContactResponse contactResponseFromJson(String str) =>
    ContactResponse.fromJson(json.decode(str));

String contactResponseToJson(ContactResponse data) =>
    json.encode(data.toJson());

class ContactResponse {
  final List<Contact> contacts;

  ContactResponse({
    required this.contacts,
  });

  factory ContactResponse.fromJson(Map<String, dynamic> json) {
    return ContactResponse(
      contacts: List<Contact>.from(
        json['contacts'].map((item) => Contact.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contacts': contacts.map((item) => item.toJson()).toList(),
    };
  }
}

class Contact {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String photoUrl;

  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.photoUrl,
  });

  String get fullName => '$firstName $lastName';

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      email: json['email'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}