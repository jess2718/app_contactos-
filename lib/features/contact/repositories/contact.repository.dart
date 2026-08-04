import '../models/contact.model.dart';

class ContactRepository {

  /// Base de datos en memoria
  final List<Contact> _contacts = [

    Contact(
      id: 1,
      firstName: 'José',
      lastName: 'Rodríguez',
      phone: '0999999999',
      email: 'jose@email.com',
      photoUrl: '',
    ),

    Contact(
      id: 2,
      firstName: 'María',
      lastName: 'López',
      phone: '0988888888',
      email: 'maria@email.com',
      photoUrl: '',
    ),

    Contact(
      id: 3,
      firstName: 'Carlos',
      lastName: 'Andrade',
      phone: '0977777777',
      email: 'carlos@email.com',
      photoUrl: '',
    ),

    Contact(
      id: 4,
      firstName: 'Jessica ',
      lastName: 'Cordova',
      phone: '0988237906',
      email: 'jessicaabigailcordovaguanga@gmail.com',
      photoUrl: '',
    ),

  ];

  /// Obtener todos los contactos
  List<Contact> getAll() {
    return _contacts;
  }

  /// Buscar por ID
  Contact? getById(int id) {
    try {
      return _contacts.firstWhere(
        (contact) => contact.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  /// Agregar contacto
  void add(Contact contact) {
    _contacts.add(contact);
  }

  /// Actualizar contacto
  void update(Contact contact) {

    final index = _contacts.indexWhere(
      (item) => item.id == contact.id,
    );

    if (index != -1) {
      _contacts[index] = contact;
    }

  }

  /// Eliminar contacto
  void delete(int id) {
    _contacts.removeWhere(
      (item) => item.id == id,
    );
  }

}