import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/search/model/search_resp.dart';
import 'package:netflix/domain/search/model/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    //idle state
    on<Initialize>((event, emit) async {
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      //get trending
      final result = await _downloadsService.getDownloadsImages();
      result.fold(
        (MainFailure f) {
          emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          ));
        },
        (List<Downloads> list) {
          emit(SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false,
          ));
        },
      );
      //show to ui
    });

    // search result state
    on<SearchMovie>((event, emit) async {
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      //call search movie api

      final result =
          await _searchService.SearchMovies(movieQuery: event.movieQuery);
      final state = result.fold(
        (MainFailure f) {
 emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          ));
        },
        (SearchResponse r){
             emit(SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false,
          ));
        },
      );
      // show to ui
    emit (state);
    });
  }
}
