import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meplix/service/model/result/result_tv.dart';
import 'package:meplix/service/rest_api/rest_client.dart';
import 'package:meplix/ui/component/constant.dart';
import 'package:meplix/ui/component/label_text.dart';
import 'package:meplix/ui/screen/detail.dart';

class TvShow extends StatefulWidget {
  @override
  State<TvShow> createState() => _TvShowState();
}

class _TvShowState extends State<TvShow> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTV();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final _logger = Logger();

  bool _loadTv = true;

  List<ResultTV> _resultsTV = List<ResultTV>();

  Future getTV() async {
    String _token = "b43d235aa9144859409b75c08db85205";

    final dio = Dio();
    final client = RestClient(dio);

    client.getTV(_token).then((it) {
      setState(() {
        _resultsTV = it.result;
        _loadTv = false;
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
      body: _loadTv == true
          ? Center(
            child: Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.only(top: 16, left: 16),
                child: CircularProgressIndicator(
                  color: primary,
                ),
              ),
          )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 90.0,
              ),
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(16, 16, 16, 180),
              itemCount: _resultsTV.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(Detail(
                      title: _resultsTV[index].name,
                      overview: _resultsTV[index].overview,
                      poster: _resultsTV[index].poster,
                      voteAverage: _resultsTV[index].voteAverage,
                      popularity: _resultsTV[index].popularity,
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
                                      _resultsTV[index].poster),
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
    );
  }
}
