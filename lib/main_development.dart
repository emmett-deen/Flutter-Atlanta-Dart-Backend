import 'package:flutter_atlanta_packages_example/bootstrap.dart';
import 'package:flutter_atlanta_packages_example/data/providers/api_provider.dart';
import 'package:flutter_atlanta_packages_example/presentation/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  bootstrap(
    () => RepositoryProvider(
      create: (context) => APIProvider(
        host: 'http://localhost:8080',
      ),
      child: const App(),
    ),
  );
}
