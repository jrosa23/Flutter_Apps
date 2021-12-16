import 'package:first_flutter_app/model/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsThumbnail extends StatelessWidget {
  const MovieDetailsThumbnail({Key? key, required this.thumbnail})
      : super(key: key);
  final String thumbnail;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.cover),
                )),
            const Icon(Icons.play_circle_outline, size: 90, color: Colors.white)
          ],
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          height: 80.0,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget{
  const MovieDetailsHeaderWithPoster({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: movie.images[2].toString()),
          const SizedBox(width: 16.0),
          Expanded(
              child: MovieDetailsHeader(movie: movie)
          )
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget{
  const MoviePoster({Key? key, required this.poster}) : super(key: key);
  final String poster;
  @override
  Widget build(BuildContext context){
    var borderRadius = const BorderRadius.all(Radius.circular(10));
    return Card(
        child: ClipRRect(
            borderRadius: borderRadius,
            child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(poster),
                        fit: BoxFit.cover)
                )
            )
        )
    );
  }
}

class MovieDetailsHeader extends StatelessWidget{
  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${movie.year} . ${movie.genre}".toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.purple
              )),
          Text(movie.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 32.0,
              )),
          Text.rich(TextSpan(style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w300
          ), children: <TextSpan>[
            TextSpan(
                text: movie.plot
            ),
            const TextSpan(
                text: " More...",
                style: TextStyle(
                    color: Colors.indigo
                )
            )
          ]
          ))
        ]
    );
  }
}

class MovieDetailsCast extends StatelessWidget{
  const MovieDetailsCast({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
          children: <Widget>[
            MovieField(field: "Cast", value:movie.actors),
            MovieField(field: "Directors", value: movie.director),
            MovieField(field: "Awards", value: movie.awards),
            MovieField(field: "Language(s)", value: movie.language),
          ]
      ),
    );
  }
}

class MovieField extends StatelessWidget{
  const MovieField({Key? key, required this.field, required this.value}) : super(key: key);
  final String field;
  final String value;
  @override
  Widget build(BuildContext context){
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$field : ",
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300
              )),
          Expanded(
            child: Text(value, style: const TextStyle(
                color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w300
            )),
          )
        ]
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  const MovieDetailsExtraPosters({Key? key, required this.posters}) : super(key: key);
  final List<String> posters;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("More Movie Posters".toUpperCase(),
              style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54
              ),),
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 8.0),
                itemCount: posters.length,
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 170,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(posters[index]),
                              fit: BoxFit.cover)
                      )
                  ),
                )
            ),)
        ]
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Container(
          height: 0.5,
          color: Colors.grey,
        )
    );
  }
}