import 'package:cine_app/src/models/pelicula_model.dart' as prefix0;
import 'package:flutter/material.dart';


import 'package:cine_app/src/models/pelicula_model.dart';


class PeliculaDetalle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments; 

    return Scaffold( 
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0,),
                _posterTitulo(pelicula,context),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
              ]
            ) ,
          ),

        ],
      ),
    );
  }

  Widget  _posterTitulo(Pelicula pelicula, BuildContext context){

    return Container(
      padding:EdgeInsets.symmetric(horizontal: 10.0) ,
      child:  Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(pelicula.getPosterImg()),
              height: 150,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(pelicula.title, 
                  style: Theme.of(context).textTheme.title
                ),
                Text(pelicula.originalTitle, 
                  style: Theme.of(context).textTheme.subhead,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(pelicula.voteAverage.toString(),
                    style: Theme.of(context).textTheme.subhead  )
                  ],
                )
              ],
            ),
          )
      ],),
    );
  }






  Widget _crearAppbar(Pelicula pelicula){

    String tituloPelicula = pelicula.title;


    return SliverAppBar(
      forceElevated: false,
      elevation: 2.0,
      backgroundColor: Colors.blueAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 80,right: 80, bottom: 10 ),
        title: Text(
          tituloPelicula,
          textAlign: TextAlign.center,
          //overflow: TextOverflow.fade,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.00),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImg()),
          placeholder: AssetImage("assets/img/loading.gif"),
          //fadeInDuration: Duration(microseconds:150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }



  Widget _descripcion(Pelicula pelicula){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );

  }


}