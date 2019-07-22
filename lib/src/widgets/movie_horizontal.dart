import 'package:cine_app/src/models/pelicula_model.dart';
import 'package:flutter/material.dart';


class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

    final _screenSize =MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.5,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage:1,
          viewportFraction:0.3),
        children: _tarjetas(context),
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context){
    return peliculas.map((pelicula){
      return Container(
        margin: EdgeInsets.only(right:15.0 ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child:FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage("assets/img/no-image.jpg"),
                fit: BoxFit.cover,
                height: 200.0,
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
              pelicula.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              //overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }



}