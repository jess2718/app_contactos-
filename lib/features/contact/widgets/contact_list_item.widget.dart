 import 'package:flutter/material.dart';

import '../models/contact.model.dart';

class ContactListItem extends StatelessWidget {

  final Contact contact;
  final VoidCallback? onTap;

  const ContactListItem({
    super.key,
    required this.contact,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      child: ListTile(

        onTap: onTap,

        leading: CircleAvatar(

          radius: 24,

          child: Text(

            contact.firstName.substring(0, 1).toUpperCase(),

          ),

        ),

        title: Text(

          contact.fullName,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),

        ),

        subtitle: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(contact.phone),

            Text(contact.email),

          ],

        ),

        trailing: const Icon(Icons.chevron_right),

      ),

    );

  }

}