import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/contact.provider.dart';
import '../models/contact.model.dart'; // Asegúrate de importar tu modelo

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Especificamos el tipo completo para evitar errores de tipo dinámico
    final contacts = context.select<ContactProvider, List<Contact>>(
      (provider) => provider.contacts,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'),
        elevation: 0,
        centerTitle: true,
      ),
      body: AnimatedSwitcher(
        // ✅ Animación suave al cargar/vaciar la lista
        duration: const Duration(milliseconds: 300),
        child: contacts.isEmpty
            ? const _EmptyStateWidget(key: ValueKey('empty'))
            : _ContactListWidget(
                contacts: contacts, key: const ValueKey('list')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onAddContact(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Navegación a nuevo contacto (lógica separada)
  void _onAddContact(BuildContext context) {
    // Aquí agrega tu navegación: Navigator.push(...);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Función de agregar contacto pendiente')),
    );
  }
}

/// Widget separado para la lista de contactos (mejor legibilidad)
class _ContactListWidget extends StatelessWidget {
  const _ContactListWidget({required this.contacts, super.key});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: contacts.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: 72,
        endIndent: 16, // ✅ Alineación simétrica
      ),
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return _ContactTile(contact: contact);
      },
    );
  }
}

/// Tile individual de contacto (reutilizable y organizado)
class _ContactTile extends StatelessWidget {
  const _ContactTile({required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initial = contact.fullName.trim().isNotEmpty
        ? contact.fullName[0].toUpperCase()
        : '?';

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
        child: Text(
          initial,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      title: Text(
        contact.fullName,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        contact.phone,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios, // ✅ Ícono más moderno
        size: 16,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      onTap: () {
        // TODO: Navegar a detalle/editar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Seleccionaste a ${contact.fullName}')),
        );
      },
    );
  }
}

/// Estado vacío optimizado
class _EmptyStateWidget extends StatelessWidget {
  const _EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.contacts_outlined,
              size: 96,
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
            ),
            const SizedBox(height: 24),
            Text(
              'No tienes contactos',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Agrega nuevos contactos para comenzar.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
