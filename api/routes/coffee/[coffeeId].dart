import 'package:coffee_api/datasources/coffee_datasource.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String coffeeId) async {
  final coffeeDataSource = context.read<CoffeeDataSource>();
  final coffee = await coffeeDataSource.get(coffeeId);
  return Response.json(body: coffee);
}
