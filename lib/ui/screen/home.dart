import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meplix/service/model/result/results.dart';
import 'package:meplix/service/rest_api/rest_client.dart';
import 'package:meplix/ui/component/constant.dart';
import 'package:meplix/ui/component/label_text.dart';
import 'package:meplix/ui/screen/detail.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTopRating();
    getPopular();
    getNowShowing();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final _logger = Logger();

  bool _loadTopRating = true;
  bool _loadNowPlaying = true;
  bool _loadPopular = true;

  List<Results> _resultsTopRating = List<Results>();
  List<Results> _resultsNowPlaying = List<Results>();
  List<Results> _resultsPopular = List<Results>();

  Future getTopRating() async {
    String _token = "b43d235aa9144859409b75c08db85205";

    final dio = Dio();
    final client = RestClient(dio);

    client.getTopRatedMovie(_token).then((it) {
      setState(() {
        _resultsTopRating = it.result;
        _loadTopRating = false;
      });
      _logger.i(it.toJson());
    });
  }

  Future getPopular() async {
    String _token = "b43d235aa9144859409b75c08db85205";

    final dio = Dio();
    final client = RestClient(dio);

    client.getPopularMovie(_token).then((it) {
      setState(() {
        _resultsPopular = it.result;
        _loadPopular = false;
      });
      _logger.i(it.toJson());
    });
  }

  Future getNowShowing() async {
    String _token = "b43d235aa9144859409b75c08db85205";

    final dio = Dio();
    final client = RestClient(dio);

    client.getNowPlayingMovie(_token).then((it) {
      setState(() {
        _resultsNowPlaying = it.result;
        _loadNowPlaying = false;
      });
      _logger.i(it.toJson());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg2,
        title: Image.asset("assets/img/logo.png", height: 26),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: LabelText(
                "Top Rating",
                color: textWhite,
                weight: FontWeight.w600,
                size: 16,
              ),
            ),
            _loadTopRating == true
                ? Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(top: 16, left: 16),
                    child: CircularProgressIndicator(
                      color: primary,
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 16),
                    child: SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _resultsTopRating.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(Detail(
                                title: _resultsTopRating[index].title,
                                overview: _resultsTopRating[index].overview,
                                poster: _resultsTopRating[index].poster,
                                voteAverage:
                                    _resultsTopRating[index].voteAverage,
                                popularity: _resultsTopRating[index].popularity,
                              ));
                            },
                            child: Container(
                              width: 150,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "http://image.tmdb.org/t/p/w500/" +
                                                _resultsTopRating[index]
                                                    .poster),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.star,
                                              color: star, size: 14),
                                          SizedBox(width: 4),
                                          LabelText(
                                            _resultsTopRating[index]
                                                .voteAverage
                                                .toString(),
                                            color: textWhite,
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: LabelText(
                                      _resultsTopRating[index].title,
                                      color: textWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: LabelText(
                "Popular",
                color: textWhite,
                weight: FontWeight.w600,
                size: 16,
              ),
            ),
            _loadPopular == true
                ? Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(top: 16, left: 16),
                    child: CircularProgressIndicator(
                      color: primary,
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 16),
                    child: SizedBox(
                      height: 270,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _resultsPopular.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(Detail(
                                title: _resultsPopular[index].title,
                                overview: _resultsPopular[index].overview,
                                poster: _resultsPopular[index].poster,
                                voteAverage: _resultsPopular[index].voteAverage,
                                popularity: _resultsPopular[index].popularity,
                              ));
                            },
                            child: Container(
                              width: 150,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "http://image.tmdb.org/t/p/w500/" +
                                                _resultsPopular[index].poster),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.visibility,
                                              color: star, size: 14),
                                          SizedBox(width: 4),
                                          LabelText(
                                            _resultsPopular[index]
                                                .popularity
                                                .toString(),
                                            color: textWhite,
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: LabelText(
                                      _resultsPopular[index].title,
                                      color: textWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: LabelText(
                "Now Playing",
                color: textWhite,
                weight: FontWeight.w600,
                size: 16,
              ),
            ),
            _loadNowPlaying == true
                ? Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(top: 16, left: 16),
                    child: CircularProgressIndicator(
                      color: primary,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.only(top: 16, bottom: 100),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 6.0,
                            mainAxisSpacing: 90.0,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _resultsNowPlaying.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(Detail(
                                  title: _resultsNowPlaying[index].title,
                                  overview: _resultsNowPlaying[index].overview,
                                  poster: _resultsNowPlaying[index].poster,
                                  voteAverage:
                                      _resultsNowPlaying[index].voteAverage,
                                  popularity:
                                      _resultsNowPlaying[index].popularity,
                                ));
                              },
                              child: Container(
                                // width: 150,
                                child: Wrap(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "http://image.tmdb.org/t/p/w500/" +
                                                  _resultsNowPlaying[index]
                                                      .poster),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
