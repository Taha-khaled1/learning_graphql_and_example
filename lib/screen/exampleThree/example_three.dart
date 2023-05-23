import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qraphql/screen/exampleThree/model.dart';

import '../../main.dart';

class exampleThree extends StatefulWidget {
  const exampleThree({Key? key}) : super(key: key);

  @override
  State<exampleThree> createState() => _exampleThreeState();
}

class _exampleThreeState extends State<exampleThree> {
  @override
  Widget build(BuildContext context) {
    int limit = 2;
    final String fetchUsersQuery = '''
           query ExampleQuery() {
              company {
                ceo
                coo
                cto
                cto_propulsion
                employees
                links {
                  elon_twitter
                  flickr
                  twitter
                  website
                }
              }
              cores(limit: $limit, sort: "id") {
                asds_attempts
                id
                missions {
                  flight
                  name
                }
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
              print(result.data!);
              // bool islooding = false;
              final QueryModelThree queryModel =
                  QueryModelThree.fromJson(result.data!);

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CEO: ${queryModel.company!.ceo}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'COO: ${queryModel.company!.coo}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'CTO: ${queryModel.company!.cto}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'CTO Propulsion: ${queryModel.company!.ctoPropulsion}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Employees: ${queryModel.company!.employees}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Links:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      ListTile(
                        leading: const Icon(Icons.link),
                        title: const Text(
                          'Elon Twitter',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          queryModel.company!.links!.elonTwitter ?? '',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          // Handle link tap
                        },
                      ),
                      for (int i = 0; i < (queryModel.cores!.length); i++)
                        Text('${queryModel.cores![i].id}'),
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
