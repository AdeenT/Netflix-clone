import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/failures/main_failure.dart';
import 'package:netflix/domain/search/model/search_resp.dart';

abstract class SearchService{
  Future<Either<MainFailure, SearchResponse>> SearchMovies({
    required String movieQuery,
  });
}