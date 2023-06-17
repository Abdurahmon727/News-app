import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/features/home/data/models/objectbox_singleton.dart';

import '../../../../../core/data/service_locator.dart';
import '../../../../home/data/models/news.dart';

part 'saved_news_event.dart';
part 'saved_news_state.dart';
part 'saved_news_bloc.freezed.dart';

class SavedNewsBloc extends Bloc<SavedNewsEvent, SavedNewsState> {
  SavedNewsBloc() : super(const _SavedNewsState()) {
    on<_GetNewsFromStorage>((event, emit) {
      final result = sl<ObjectBoxSingleton>().getAllNews();
      emit(state.copyWith(models: result));
    });

    on<_AddOneNews>((event, emit) {
      final newModels = List<NewsModel>.from([event.model] + state.models);
      emit(state.copyWith(models: newModels));
      sl<ObjectBoxSingleton>().putNews(newModels);
    });

    on<_RemoveOneNews>((event, emit) {
      final isContains = state.models.contains(event.model);
      if (isContains) {
        var newModels = List<NewsModel>.from(state.models);
        newModels.remove(event.model);
        emit(state.copyWith(models: newModels));
      }
    });

    on<_Clear>((event, emit) {
      emit(const SavedNewsState(models: []));
      sl<ObjectBoxSingleton>().clearNews();
    });
  }
}
