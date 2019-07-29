
import 'package:http/http.dart'as http;

import 'dart:async';
import 'dart:convert';

import 'package:cine_app/src/models/pelicula_model.dart';

class PeliculasProvider{

  //
  String _apiKey = "01c5101282dc85d65c7c73b4a30744f9"; //generar su propia KEY para evitar problemas
  String _url = "api.themoviedb.org";
  String _lenguaje= "es-ES";

  int _popularesPage = 0;  //contador de paginas
  bool cargando = false;



  List<Pelicula> _populares= new List();   //lista de peliculas vacia

  final _popularesStreamControler = StreamController<List<Pelicula>>.broadcast();  //broadcast permite transmitir a multiples widget

  Function(List<Pelicula>) get popularesSink => _popularesStreamControler.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamControler.stream;


  void disposeStream(){
        _popularesStreamControler?.close();
  }


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
    if (cargando)return [];

    cargando = true;

    _popularesPage++;
    final url =Uri.https(_url, "3/movie/popular",{
      "api_key": _apiKey,
      "language": _lenguaje,
      "page" :_popularesPage.toString() 

    });
    // procesamos la respuesta 
    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink(_populares);
    cargando = false;
    return resp;

    


  }

}