import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(generateForDir: ['di'])
Future<void> configureDependencies() async =>
    await GetItInjectableX(getIt).init();