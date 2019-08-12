import 'package:flutter/material.dart';

import 'package:cine_app/src/models/pelicula_model.dart';
import 'package:cine_app/src/Provider/peliculas_provider.dart';


class DataSearch extends SearchDelegate{


  String seleccion = "";
  final peliculasProvider = new PeliculasProvider();

  final peliculas =[
    "spiderman",
    "acuaman",
    "bob esponja",
    "avengers",
    "interno",
    "coco"
  ];

  final peliculasRecientes =[
    "luna",
    "wisper",
    "botitas"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones del appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono a la izquierda 
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ), 
      onPressed: (){
        print("leadin press");
        close(context,null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados que vamos a mostrar 
    return Container();
    /*
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.amberAccent,
        child: Text(seleccion),
      ),
    );*/
  }

  @override
  Widget buildSuggestions(BuildContext context) {  
    if(query.isEmpty){
      return Container();
    }
    return FutureBuilder(
      future:  peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData){
          final peliculas  = snapshot.data;
          return  ListView(
            children: peliculas.map((pelicula){
              return ListTile(
                leading:FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage("assets/img/no-image.jpg"),
                  width:  50.0,
                  fit: BoxFit.contain,
                ),
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.originalTitle),
                  onTap: (){
                    close(context,null);
                    pelicula.uniqueID ="";
                    Navigator.pushNamed(context, "detalle",arguments: pelicula);
                  },
              );
            }).toList(),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
    // sugerencias cuando escribe 
/*
    final listaSugerida = (query.isEmpty)? 
                          peliculasRecientes 
                          : peliculas.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: (){
            seleccion= listaSugerida[i];
            showResults(context);
          },
        );
      },
    );
  }*/




