import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/trending.dart';

abstract class BaseTrendingRepository {
  Future<Either<Failure, List<Trending>>> getTrending();
}
