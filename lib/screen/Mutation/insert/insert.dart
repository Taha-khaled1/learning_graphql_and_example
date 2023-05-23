import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qraphql/main.dart';
import 'package:qraphql/widget/button.dart';
import 'package:qraphql/widget/customtextfild.dart';

String name = '';
String twitter = '';

class InserUser extends StatelessWidget {
  const InserUser({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = 15;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfeild(
              onChanged: (p0) {
                name = p0.toString();
              },
              valid: (p0) {},
              onsaved: (p0) {},
              titel: 'name',
              width: 300,
              height: 80,
            ),
            SizedBox(height: height),
            CustomTextfeild(
              onChanged: (p0) {
                twitter = p0.toString();
              },
              valid: (p0) {},
              onsaved: (p0) {},
              titel: 'twitter',
              width: 300,
              height: 80,
            ),
            SizedBox(height: height),
            BeautifulButton(
              text: 'add user',
              color: Colors.deepPurple,
              onPressed: () async {
                print('$name ---- $twitter');
                if (name.isNotEmpty && twitter.isNotEmpty) {
                  // ignore: prefer_const_declarations
                  final mutation = r'''
                    mutation Mutation($objects: [users_insert_input!]!) {
                      insert_users(objects: $objects) {
                        affected_rows
                        returning {
                          id
                          name
                          rocket
                          timestamp
                          twitter
                        }
                      }
                    }
                  ''';

                  final variables = {
                    'objects': [
                      {
                        'name': name,
                        'rocket': 'Falcon 9',
                        'timestamp': '2023-05-23T12:00:00Z',
                        'twitter': twitter,
                      }
                    ]
                  };

                  final result = await client.value.mutate(
                    MutationOptions(
                      document: gql(mutation),
                      variables: variables,
                    ),
                  );

                  if (result.hasException) {
                    print('Mutation failed: ${result.exception.toString()}');
                  } else {
                    print('Mutation succeeded: ${result.data.toString()}');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
