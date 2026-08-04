import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'features/contact/providers/contact.provider.dart';

void main() {

  runApp(

    MultiProvider(

      providers: [

        ChangeNotifierProvider(

          create: (_) => ContactProvider()
            ..loadContacts(),

        ),

      ],

      child: const App(),

    ),

  );

}