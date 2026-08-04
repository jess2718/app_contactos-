import 'package:flutter/material.dart';

import '../models/contact.model.dart';
import '../repositories/contact.repository.dart';

class ContactProvider extends ChangeNotifier {

  final ContactRepository _repository = ContactRepository();

  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  /// Cargar información inicial
  void loadContacts() {
    _contacts = _repository.getAll();
    notifyListeners();
  }

  /// Obtener un contacto
  Contact? getById(int id) {
    return _repository.getById(id);
  }

  /// Agregar contacto
  void addContact({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    String photoUrl = '',
  }) {

    final nextId = _contacts.isEmpty
        ? 1
        : _contacts.map((c) => c.id).reduce((a, b) => a > b ? a : b) + 1;

    final contact = Contact(
      id: nextId,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      photoUrl: photoUrl,
    );

    _repository.add(contact);

    loadContacts();
  }

  /// Actualizar contacto
  void updateContact(Contact contact) {

    _repository.update(contact);

    loadContacts();

  }

  /// Eliminar contacto
  void deleteContact(int id) {

    _repository.delete(id);

    loadContacts();

  }

}