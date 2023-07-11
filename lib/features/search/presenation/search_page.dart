import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/colors.dart';
import '../../../assets/constants.dart';
import '../../../core/app_functions.dart';
import '../../../core/bloc/theme/theme_bloc.dart';
import '../../../core/models/formz/formz_status.dart';
import '../../../core/widgets/appino_swiper/appino_swiper.dart';
import '../../../core/widgets/pagination_loader.dart';
import '../../../core/widgets/w_scale.dart';
import '../../home/presentation/widgets/list_of_news_tile_shimmer.dart';
import '../../home/presentation/widgets/preview_news.dart';
import '../../home/presentation/widgets/preview_news_shimmer.dart';
import '../../saved_news/presentation/bloc/saved_news_bloc.dart';
import 'bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    required this.searchController,
  });
  final TextEditingController searchController;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  PageStorageKey scrollPositionKey =
      const PageStorageKey('search news scroll positon');

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
              child: Row(
                children: [
                  WScaleAnimation(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const Icon(Icons.list, color: white),
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      cursorOpacityAnimates: true,
                      showCursor: true,
                      cursorColor: white,
                      controller: widget.searchController,
                      onSubmitted: (_) {
                        context.read<SearchBloc>().add(
                            SearchEvent.search(widget.searchController.text));
                        scrollPositionKey =
                            AppFunctions.getNewUniquePageStorageKey();
                      },
                      style: const TextStyle(color: white, fontSize: 18),
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).primaryColor,
                        hintText: 'Search news',
                        hintStyle: TextStyle(color: white.withOpacity(0.7)),
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  WScaleAnimation(
                    onTap: () => context
                        .read<SearchBloc>()
                        .add(SearchEvent.search(widget.searchController.text)),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Icon(Icons.search, color: white),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<SavedNewsBloc, SavedNewsState>(
              builder: (context, state) {
                return BlocBuilder<SearchBloc, SearchState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status ||
                      previous.currentPage != current.currentPage,
                  builder: (context, state) {
                    if (state.status == FormzStatus.pure) {
                      return const SizedBox();
                    } else if (state.status ==
                        FormzStatus.submissionInProgress) {
                      if (context.read<ThemeBloc>().state.isCardView) {
                        return const Expanded(
                            child: PreviewNewsShimmer(
                          padding: EdgeInsets.only(
                              bottom: 60, left: 20, right: 20, top: 10),
                        ));
                      } else {
                        return const ListOfNewsTileShimmer();
                      }
                    } else if (state.status == FormzStatus.submissionSuccess) {
                      if (!context.watch<ThemeBloc>().state.isCardView) {
                        return Expanded(
                            child: PaginationListView(
                          isFailedToLoadMore: state.isFailedToLoadMore,
                          models: state.resultModels,
                          onLoadMore: () => context
                              .read<SearchBloc>()
                              .add(const SearchEvent.fetchAndAddModels()),
                        ));
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${state.currentPage}/${state.maxPage}'),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height - 167,
                              width: double.maxFinite,
                              child: WAppinioSwiper(
                                onEnd: () => context.read<SearchBloc>().add(
                                    SearchEvent.search(
                                        widget.searchController.text)),
                                currentIndex: state.currentCardIndex,
                                unlimitedUnswipe: true,
                                cardsBuilder: (context, index) => WPreviewNews(
                                    model: state.resultModels[index]),
                                cardsCount: state.resultModels.length,
                                pageSavableBloc: context.read<SearchBloc>(),
                              ),
                            ),
                            const SizedBox(height: 60),
                          ],
                        );
                      }
                    } else {
                      return RefreshIndicator(
                        color: themePrimaryColors[
                            context.read<ThemeBloc>().state.primaryColorIndex],
                        onRefresh: () async => context.read<SearchBloc>().add(
                            SearchEvent.search(widget.searchController.text)),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 173,
                            width: MediaQuery.of(context).size.width,
                            child: Text(state.errorMessage,
                                textAlign: TextAlign.center),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
