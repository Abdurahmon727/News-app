import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/data/service_locator.dart';
import '../../../home/data/models/news.dart';
import '../../../home/data/models/objectbox_singleton.dart';
import '../../../home/presentation/bloc/page_save.dart';

part 'saved_news_bloc.freezed.dart';
part 'saved_news_event.dart';
part 'saved_news_state.dart';

class SavedNewsBloc extends Bloc<SavedNewsEvent, SavedNewsState>
    implements CurrentPageSavable {
  SavedNewsBloc() : super(const _SavedNewsState()) {
    on<_GetNewsFromStorage>((event, emit) {
      final result = sl<ObjectBoxSingleton>().getAllNews();
      emit(state.copyWith(models: result));
    });

    on<_AddOrRemove>((event, emit) {
      final isContains = state.models.contains(event.model);
      if (isContains) {
        var newModels = List<NewsModel>.from(state.models);
        newModels.removeWhere((element) => element.title == event.model.title);
        sl<ObjectBoxSingleton>().deleteNews(event.model.id);
        emit(state.copyWith(models: newModels, currentPage: 0));
      } else {
        final newModels = List<NewsModel>.from(state.models + [event.model]);
        sl<ObjectBoxSingleton>().putNews(event.model);
        emit(state.copyWith(models: newModels, currentPage: 0));
      }
    });

    on<_Clear>((event, emit) {
      emit(const SavedNewsState(models: []));
      sl<ObjectBoxSingleton>().clearNews();
    });

    on<_ChangeCurrentPage>(
        (event, emit) => emit(state.copyWith(currentPage: event.newPageIndex)));
  }

  @override
  void saveCurruntPage(int newPageIndex) {
    add(SavedNewsEvent.changeCurrentPage(newPageIndex));
  }
}
