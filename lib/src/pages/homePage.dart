import 'package:cine_app/src/Provider/peliculas_provider.dart';


import 'package:cine_app/src/widgets/card_swiper_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        centerTitle:true ,
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
          
        ],
      ),
      body: Container(
        child:Column (
        children: <Widget>[
          _swiperTarjetas(),
        ]
        )
      )
    );
  }

  Widget _swiperTarjetas(){

    //peliculasProvider.getEnCines();
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData){
          return CardSwiper(peliculas: snapshot.data);
        }else{
          return Container(
            height: 400.0,
            child: Center(
              child:CircularProgressIndicator() ,
            ),
          );
        }
      }
    );  
  }
}