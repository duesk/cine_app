import 'package:cine_app/src/Provider/peliculas_provider.dart';


import 'package:cine_app/src/widgets/card_swiper_widget.dart';
import 'package:cine_app/src/widgets/movie_horizontal.dart';
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
        child:ListView (
          //mainAxisAlignment:MainAxisAlignment.spaceAround ,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context)
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

  Widget _footer(BuildContext context){
      return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0 ) ,
              child: Text("populares", style:Theme.of(context).textTheme.subhead)
            ),
            SizedBox(
              height: 20.0,
            ),
            FutureBuilder(
              future: peliculasProvider.getPopulares(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                //snapshot.data?.forEach((p)=> print(p.title));
                
                return (snapshot.hasData)? MovieHorizontal(peliculas: snapshot.data,):CircularProgressIndicator();
                
              },
            ),
          ],
        ),
      );

  }


}