
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:cine_app/src/models/pelicula_model.dart';

class PeliculasProvider{

  String _apiKey = "01c5101282dc85d65c7c73b4a30744f9";
  String _url = "api.themoviedb.org";
  String _lenguaje= "es-ES";

  Future<List<Pelicula>> _procesarRespuesta(Uri url)async{
    final resp = await  http.get(url); //resp = respuesta del http
    final decodeData = json.decode(resp.body);
    final peliculas =new Peliculas.fromJsonList(decodeData["results"]);
    //print(peliculas.items[1].title)
    return peliculas.items;

  }


  Future<List<Pelicula>> getEnCines() async{
    final url =Uri.https(_url, "3/movie/now_playing",{
      "api_key": _apiKey,
      "language": _lenguaje
    });
    return await _procesarRespuesta(url);
  }


  Future<List<Pelicula>> getPopulares() async{
    final url =Uri.https(_url, "3/movie/popular",{
      "api_key": _apiKey,
      "language": _lenguaje
    });
    return await _procesarRespuesta(url);
  }

}