import 'package:flutter/material.dart';

import 'core/router/app.router.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(

      debugShowCheckedModeBanner: false,

      title: 'Contacts',

      routerConfig: AppRouter.router,

    );

  }

}