import 'package:my_app_project/domain/entities/advice_entity.dart';
import 'package:my_app_project/domain/failures/failures.dart';
import 'package:my_app_project/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

import '../../data/repositories/advice_repo_impl.dart';

class AdviceUseCases {
  AdviceUseCases({required this.adviceRepo});
  final AdviceRepo adviceRepo;

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
    // space for business logic
  }
}
