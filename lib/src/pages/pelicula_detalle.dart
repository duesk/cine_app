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
                _posterTitulo(pelicula)
              ]
            ) ,
          ),

        ],
      ),
    );
  }

  Widget  _posterTitulo(Pelicula pelicula){

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



}