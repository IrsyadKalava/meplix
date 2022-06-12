import 'package:flutter/material.dart';
import 'package:meplix/ui/component/constant.dart';
import 'package:meplix/ui/component/label_text.dart';

class Detail extends StatefulWidget {
  final String title;
  final String overview;
  final String poster;
  final double voteAverage;
  final double popularity;

  Detail(
      {this.title,
      this.overview,
      this.poster,
      this.voteAverage,
      this.popularity});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg2,
        title: Text("Detail"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
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
                                    widget.poster),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      LabelText(
                        widget.title,
                        color: textWhite,
                        weight: FontWeight.w600,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(
                      'Overview :',
                      color: textGrey,
                      weight: FontWeight.w600,
                      size: 14,
                    ),
                    SizedBox(height: 8),
                    LabelText(
                      widget.overview,
                      color: textGrey,
                      weight: FontWeight.w600,
                      size: 13,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: star, size: 14),
                        SizedBox(width: 4),
                        LabelText(
                          widget.voteAverage.toString() + "   |   ",
                          color: textGrey,
                          size: 12,
                        ),
                        Icon(Icons.visibility, color: star, size: 14),
                        SizedBox(width: 4),
                        LabelText(
                          widget.popularity.toString(),
                          color: textGrey,
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
