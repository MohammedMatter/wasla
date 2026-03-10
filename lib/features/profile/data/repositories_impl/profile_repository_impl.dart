import 'package:wasla/core/common/entities/user.dart';
import 'package:wasla/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:wasla/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRemoteDataSource remoteDataSource;
  ProfileRepositoryImpl({required this.remoteDataSource});
  @override
  Future<User?> getUserInfo() {
    return remoteDataSource.getUserInfo();
  }
}
