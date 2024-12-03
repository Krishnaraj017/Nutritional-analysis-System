import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'weatherProviderApiKey', obfuscate: true)
  static final String weatherApiKey = _Env.weatherApiKey;
}
