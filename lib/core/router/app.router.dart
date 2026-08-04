import 'package:go_router/go_router.dart';

import '../../features/contact/pages/contact_list.page.dart';

class AppRouter {

  static final router = GoRouter(

    initialLocation: '/contacts',

    routes: [

      GoRoute(

        path: '/contacts',

        builder: (context, state) {

          return const ContactListPage();

        },

      ),

    ],

  );

}