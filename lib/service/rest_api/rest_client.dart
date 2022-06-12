import 'package:meplix/service/model/m_now_playing.dart/m_now_playing.dart';
import 'package:meplix/service/model/m_popular/m_popular.dart';
import 'package:meplix/service/model/m_top_rated/m_top_rated.dart';
import 'package:meplix/service/model/m_tv/m_tv.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("movie/top_rated")
  Future<MTopRated> getTopRatedMovie(
    @Query("api_key") String token,
  );

  @GET("movie/now_playing")
  Future<MNowPlaying> getNowPlayingMovie(
    @Query("api_key") String token,
  );

  @GET("movie/popular")
  Future<MPopular> getPopularMovie(
    @Query("api_key") String token,
  );

  @GET("tv/airing_today")
  Future<Mtv> getTV(
    @Query("api_key") String token,
  );
}
