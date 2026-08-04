 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/contact.provider.dart';
import '../widgets/contact_list_item.widget.dart';

class ContactListPage extends StatelessWidget {

  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {

    final contacts = context.watch<ContactProvider>().contacts;

    return Scaffold(

      appBar: AppBar(
        title: const Text('Contactos'),
      ),

      body: contacts.isEmpty

          ? const Center(
              child: Text('No existen contactos'),
            )

          : ListView.builder(

              itemCount: contacts.length,

              itemBuilder: (context, index) {

                final contact = contacts[index];

                return ContactListItem(

                  contact: contact,

                  onTap: () {

                    // Próximamente:
                    // Navegar al detalle.

                  },

                );

              },

            ),

    );

  }

}