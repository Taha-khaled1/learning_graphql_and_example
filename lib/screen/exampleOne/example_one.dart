import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qraphql/screen/exampleOne/model.dart';

import '../../main.dart';

class ExampleOne extends StatelessWidget {
  const ExampleOne({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String fetchUsersQuery = '''
            query ExampleQuery {
              company {
                ceo
              }
              roadster {
                apoapsis_au
              }
            }

            ''';

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: GraphQLProvider(
        client: client,
        child: Query(
          options: QueryOptions(
            document: gql(fetchUsersQuery),
          ),
          builder: (result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text('Error: ${result.exception.toString()}');
            } else if (result.isLoading) {
              return const Text('Loading...');
            } else {
              final QueryModel queryModel = QueryModel.fromJson(result.data!);
              // print(data);
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Company CEO:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        queryModel.company.ceo,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Roadster Apoapsis:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        queryModel.roadster.apoapsis.toString(),
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
              // Text('Data: $data');
            }
          },
        ),
      ),
    );
  }
}
