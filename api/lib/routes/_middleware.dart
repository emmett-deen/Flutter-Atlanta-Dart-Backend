import 'package:coffee_api/datasources/coffee_datasource.dart';
import 'package:coffee_api/persistence/sql_client.dart';
import 'package:dart_frog/dart_frog.dart';

/// Middleware function that uses requestLogger and injectionHandler.
Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(injectionHandler());
}

/// Middleware function that provides an instance of CoffeeDataSource.
Middleware injectionHandler() {
  return (handler) {
    return handler.use(
      provider<CoffeeDataSource>(
        /// Provides an instance of CoffeeDataSource using SQLClient from 
        /// context.
        (context) => CoffeeDataSource(context.read<SQLClient>()),
      ),
    );
  };
}
