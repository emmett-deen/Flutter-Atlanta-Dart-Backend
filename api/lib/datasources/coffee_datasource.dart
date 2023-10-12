import 'package:coffee_api/persistence/sql_client.dart';
import 'package:coffee_api_resources/coffee_api_resources.dart';

/// A data source for retrieving coffee data.
class CoffeeDataSource {
  /// Creates a new instance of [CoffeeDataSource].
  ///
  /// The [SQLClient] is used to execute SQL commands.
  CoffeeDataSource(this._client);

  final SQLClient _client;

  /// Retrieves all coffee data.
  ///
  /// Returns a [Future] that completes with a list of [Coffee] objects.
  Future<List<Coffee>> getAll() async {
    final result = await _client.execute('SELECT * FROM coffee');
    final items = <Coffee>[];
    for (final row in result.rows) {
      items.add(Coffee.fromJson(row.assoc()));
    }
    return items;
  }

  /// Retrieves a specific coffee data by id.
  ///
  /// Takes a [String] id and returns a [Future] that completes
  /// with a [Coffee] object.
  Future<Coffee> get(String id) async{
    final result = await _client.execute('SELECT * FROM coffee WHERE id = $id');
    return Coffee.fromJson(result.rows.first.assoc());
  }
}
