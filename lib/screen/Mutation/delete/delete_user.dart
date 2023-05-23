import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qraphql/main.dart';
import 'package:qraphql/widget/button.dart';
import 'package:qraphql/widget/customtextfild.dart';

String id = '';

class DeleteUser extends StatelessWidget {
  const DeleteUser({Key? key}) : super(key: key);
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
                id = p0.toString();
              },
              valid: (p0) {},
              onsaved: (p0) {},
              titel: 'id user for delete',
              width: 300,
              height: 80,
            ),
            SizedBox(height: height),
            SizedBox(height: height),
            BeautifulButton(
              text: 'delete user',
              color: Colors.deepPurple,
              onPressed: () async {
                print('$id');
                if (id.isNotEmpty) {
                  // ignore: prefer_const_declarations
                  final mutation = r'''
                    mutation Mutation($where: users_bool_exp!) {
                      delete_users(where: $where) {
                        returning {
                          name
                        }
                      }
                    }
                  ''';

                  final variables = {
                    "where": {
                      "id": {"_eq": "wsfgsdfg5644654"}
                    }
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
