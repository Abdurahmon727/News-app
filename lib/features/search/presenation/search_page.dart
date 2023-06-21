import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../assets/colors.dart';
import '../../../core/models/formz/formz_status.dart';
import '../../../core/widgets/appino_swiper/appino_swiper.dart';
import '../../home/presentation/widgets/preview_news.dart';

import '../../saved_news/presentation/bloc/saved_news_bloc.dart';
import 'bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onSubmitted: (_) => context
                          .read<SearchBloc>()
                          .add(SearchEvent.search(searchController.text)),
                      style: const TextStyle(color: white, fontSize: 18),
                      decoration: const InputDecoration(
                          fillColor: darkGrey,
                          hintText: 'Search news',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton.filled(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((_) => darkGrey)),
                    onPressed: () => context
                        .read<SearchBloc>()
                        .add(SearchEvent.search(searchController.text)),
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            BlocBuilder<SavedNewsBloc, SavedNewsState>(
              builder: (context, state) {
                return BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.status == FormzStatus.pure) {
                      return const SizedBox();
                    } else if (state.status ==
                        FormzStatus.submissionInProgress) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.status == FormzStatus.submissionSuccess) {
                      return Expanded(
                        child: WAppinioSwiper(
                          currentIndex: state.currentCardIndex,
                          unlimitedUnswipe: true,
                          cardsBuilder: (context, index) =>
                              WPreviewNews(model: state.resultModels[index]),
                          cardsCount: state.resultModels.length,
                          pageSavableBloc: context.read<SearchBloc>(),
                        ),
                      );
                    } else {
                      return RefreshIndicator(
                        onRefresh: () async => context
                            .read<SearchBloc>()
                            .add(SearchEvent.search(searchController.text)),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 173,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              state.errorMessage,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: white),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 60),
          ],
        ),
      );
    });
  }
}
