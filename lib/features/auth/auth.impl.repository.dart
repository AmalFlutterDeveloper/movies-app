import 'package:movies_app/features/auth/auth.datasource.dart';
import 'package:movies_app/features/auth/auth.repository.dart';
class AuthRepositoryImpl //extends AuthRepository
{
  final AuthDataSource dataSource;
  AuthRepositoryImpl(this.dataSource);
}
