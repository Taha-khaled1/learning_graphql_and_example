import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qraphql/screen/Mutation/delete/delete_user.dart';
import 'package:qraphql/screen/Mutation/insert/insert.dart';
import 'package:qraphql/screen/exampleThree/example_three.dart';
import 'package:qraphql/screen/exampleTow/example_tow.dart';
import 'package:qraphql/widget/button.dart';

import 'screen/exampleOne/example_one.dart';

late HttpLink httpLink;
late ValueNotifier<GraphQLClient> client;
void main() {
  httpLink = HttpLink(
    'https://spacex-production.up.railway.app/',
  );
  client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double height = 15;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BeautifulButton(
              text: 'Go TO EXAMPLE ONE',
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExampleOne()),
                );
              },
            ),
            const SizedBox(
              height: height,
            ),
            BeautifulButton(
              text: 'Go TO EXAMPLE TOW',
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExampleTow()),
                );
              },
            ),
            const SizedBox(
              height: height,
            ),
            BeautifulButton(
              text: 'Go TO EXAMPLE three',
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const exampleThree()),
                );
              },
            ),
            const SizedBox(
              height: height,
            ),
            BeautifulButton(
              text: 'DELETE USER',
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeleteUser()),
                );
              },
            ),
            const SizedBox(
              height: height,
            ),
            BeautifulButton(
              text: 'INSERT USER',
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InserUser()),
                );
              },
            ),
            const SizedBox(
              height: height,
            ),
            BeautifulButton(
              text: 'UPDAITE USER',
              color: Colors.green,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const DeleteUser()),
                // );
              },
            ),
            const SizedBox(
              height: height,
            ),
          ],
        ),
      ),
    );
  }
}
