import 'package:coffee_api/datasources/coffee_datasource.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final coffeeDataSource = context.read<CoffeeDataSource>();
  final coffee = await coffeeDataSource.getAll();
  return Response.json(body: coffee);
}
