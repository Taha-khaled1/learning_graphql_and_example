class ClassName {
  String queryone = '''
query ExampleQuery() {
  company {
    ceo
    coo
    cto
    cto_propulsion
    employees
  }
  ship(id: "5ea6ed2d080df4000697c901") {
    name
    id
    image
    mmsi
    type
    weight_kg
    weight_lbs
  }
  ships {
    name
    id
    image
  }
}

''';

////////////////////////////////////////////////////

  String querytwo = '''
    query ExampleQuery {
              company {
                ceo
              }
              roadster {
                apoapsis_au
              }
            }

''';

////////////////////////////////////////////////////
  ///
  String querythree = '''
         query ExampleQuery {
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
            cores {
              asds_attempts
              id
              missions {
                flight
                name
              }
            }
          }


''';

////////////////////////////////////////////////////
////////////////////////////////////////////////////
  ///
  String queryfor = '''
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
              cores(limit: 5, sort: "id") {
                asds_attempts
                id
                missions {
                  flight
                  name
                }
              }
            }


''';

////////////////////////////////////////////////////
}
