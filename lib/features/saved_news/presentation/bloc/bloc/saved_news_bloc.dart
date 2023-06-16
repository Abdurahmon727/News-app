import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../home/data/models/news.dart';

part 'saved_news_event.dart';
part 'saved_news_state.dart';
part 'saved_news_bloc.freezed.dart';

class SavedNewsBloc extends Bloc<SavedNewsEvent, SavedNewsState> {
  SavedNewsBloc() : super(const _SavedNewsState()) {
    on<_GetNewsFromStorage>((event, emit) {
      ;
    });
  }
}
