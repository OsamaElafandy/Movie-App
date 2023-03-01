import 'package:animate_do/animate_do.dart';
import 'package:arch/movies/presentation/screens/widgets/global_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constant.dart';
import 'package:arch/movies/presentation/controller/movies_bloc.dart';
import 'package:arch/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/util/enums.dart';
import '../../../core/services/service_locator.dart';
import '../controller/movies_event.dart';
import '../screens/movie_detail_screen.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<MoviesBloc>()..add(GetTopRatedMoviesEvent()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
            buildWhen: (previous, current) {
          return previous.topRatedState != current.topRatedState;
        }, builder: (context, state) {
          switch (state.topRatedState) {
            case RequestState.error:
              return SizedBox(
                  height: 170, child: Text(state.nowPlayingMessage));
            case RequestState.idle:
              return const SizedBox(
                  height: 170, child: Center(child: GlobalLoading()));

            case RequestState.loading:
              return const SizedBox(height: 170, child: GlobalLoading());
            case RequestState.success:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 170.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.topRatedMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.topRatedMovies[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  id: movie.id,
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              width: 120.0,
                              fit: BoxFit.fill,
                              imageUrl: AppConst.imageUrl(movie.backdropPath),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
          }
        }));
  }
}
