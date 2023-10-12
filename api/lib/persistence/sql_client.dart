import 'package:mysql_client/mysql_client.dart';

/// A Singleton SQLClient class.
class SQLClient {
  /// Factory constructor that returns the singleton instance.
  factory SQLClient() => _instance;

  SQLClient._internal() {
    _connect();
  }

  /// Singleton instance of SQLClient.
  static final SQLClient _instance = SQLClient._internal();

  MySQLConnection? _connection;

  /// Initializes the connection to the database.
  Future<void> _connect() async {
    _connection = await MySQLConnection.createConnection(
      host: '127.0.0.1',
      port: 3306,
      userName: 'coffee_lover',
      password: 'iheartcoffee',
      databaseName: 'coffee_types',
    );

    await _connection?.connect();
  }

  /// execute a given query and checks for db connection
  Future<IResultSet> execute(
    String query, {
    Map<String, dynamic>? params,
    bool iterable = false,
  }) async {
    if (_connection == null || _connection?.connected == false) {
      await _connect();
    }
    if (_connection?.connected == false) {
      throw Exception('Could not connect to the database');
    }
    return _connection!.execute(query, params, iterable);
  }
}
